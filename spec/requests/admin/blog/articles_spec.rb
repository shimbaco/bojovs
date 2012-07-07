# coding: utf-8

require 'spec_helper'


describe '管理画面 記事機能' do
  before do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
  end

  describe '投稿' do
    before do
      visit '/admin/blog/articles/new'
    end

    context '非公開記事' do
      context 'slugには何も入力せず保存ボタンを押す' do
        before do
          within('#admin_blog_articles.new') do
            fill_in 'blog_article_title', with: 'こんにちは世界'
            fill_in 'blog_article_body', with: 'ブログはじめました'
          end

          click_button '保存'
        end

        it '保存できる' do
          Blog::Article.count.should == 1
        end

        it 'published_atには日付は保存されない' do
          Blog::Article.first.published_at.should be_nil
        end
      end
    end

    context '公開記事' do
      context 'slugも入力して保存ボタンを押す' do
        before do
          within('#admin_blog_articles.new') do
            fill_in 'blog_article_slug', with: 'hello-world'
            fill_in 'blog_article_title', with: 'こんにちは世界'
            fill_in 'blog_article_body', with: 'ブログはじめました'
          end

          click_button '保存'
        end

        it '保存できる' do
          Blog::Article.count.should == 1
        end

        it 'published_atに日付が保存される' do
          Blog::Article.first.published_at.should_not be_nil
        end
      end
    end
  end

  describe '一覧' do
    before do
      2.times { FactoryGirl.create(:blog_article) }
      FactoryGirl.create(:blog_article, slug: nil)

      visit '/admin/blog/articles'
    end

    it 'ブログ記事が3件表示されている' do
      find('table.articles tbody').all('tr').count.should == 3
    end

    it '2つ目の記事のslugが "hello-world-2" になっている' do
      find('table.articles tbody').find('tr:nth-child(2)').should have_content('hello-world-2')
    end

    it '3つ目の記事の「表示」項目が消えている' do
      find('table.articles tbody').find('tr:nth-child(3)').find('td:nth-child(6)')
        .has_css?('a').should be_false
    end
  end

  describe '編集' do
    context '非公開記事' do
      before do
        article = FactoryGirl.create(:blog_article, slug: nil, published_at: nil)

        visit "/admin/blog/articles/#{article.id}/edit"
      end

      context 'slugを入力して保存ボタンを押す' do
        before do
          within('#admin_blog_articles.edit') do
            fill_in 'blog_article_slug', with: 'hello-world'
          end

          click_button '保存'
        end

        it '記事が更新されている' do
          Blog::Article.first.slug.should == 'hello-world'
        end

        it 'published_atに日付が保存される' do
          Blog::Article.first.published_at.should_not be_nil
        end
      end
    end

    context '公開記事' do
      before do
        @article = FactoryGirl.create(:blog_article)

        visit "/admin/blog/articles/#{@article.id}/edit"
      end

      context '公開状態のまま' do
        context '保存ボタンを押す' do
          before do
            within('#admin_blog_articles.edit') do
              fill_in 'blog_article_slug', with: 'new-hello-world'
            end

            click_button '保存'
          end

          it '記事が更新されている' do
            Blog::Article.first.slug.should == 'new-hello-world'
          end

          it 'published_atの値は変化しない' do
            Blog::Article.first.published_at.should == @article.published_at
          end
        end
      end
    end
  end

  describe '削除' do
    before do
      FactoryGirl.create(:blog_article)

      visit '/admin/blog/articles'
    end

    context '削除ボタンを押す' do
      before do
        find('table.articles td.delete a').click
      end

      it '記事が削除される' do
        Blog::Article.count.should == 0
      end

      it '削除を知らせるflashが表示される' do
        page.find('.alert').should have_content('記事を削除しました。')
      end
    end
  end
end