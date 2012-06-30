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

    context '保存ボタンを押す' do
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
    end
  end

  describe '一覧' do
    before do
      3.times { FactoryGirl.create(:blog_article) }

      visit '/admin/blog/articles'
    end

    it 'ブログ記事が3件表示されている' do
      find('table.articles tbody').all('tr').count.should == 3
    end

    it '2つ目の記事のslugが "hello-world-2" になっている' do
      find('table.articles tbody').find('tr:nth-child(2)').should have_content('hello-world-2')
    end
  end

  describe '編集' do
    before do
      article = FactoryGirl.create(:blog_article)

      visit "/admin/blog/articles/#{article.id}/edit"
    end

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
    end
  end
end