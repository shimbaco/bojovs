# coding: utf-8

require 'spec_helper'


describe '管理画面 記事機能' do
  before do
    admin = FactoryGirl.create(:admin)
    login_as(admin)
  end

  describe '投稿' do
    before do
      visit '/admin/notes/new'
    end

    context '非公開記事' do
      context 'slugには何も入力せず保存ボタンを押す' do
        before do
          within('#admin_notes.new') do
            fill_in 'note_title', with: 'こんにちは世界'
            fill_in 'note_body', with: 'ブログはじめました'
          end

          click_button '保存'
        end

        it '保存できる' do
          Note.count.should == 1
        end

        it 'published_atには日付は保存されない' do
          Note.first.published_at.should be_nil
        end
      end
    end

    context '公開記事' do
      context 'slugも入力して保存ボタンを押す' do
        before do
          within('#admin_notes.new') do
            fill_in 'note_slug', with: 'hello-world'
            fill_in 'note_title', with: 'こんにちは世界'
            fill_in 'note_body', with: 'ブログはじめました'
          end

          click_button '保存'
        end

        it '保存できる' do
          Note.count.should == 1
        end

        it 'published_atに日付が保存される' do
          Note.first.published_at.should_not be_nil
        end
      end
    end
  end

  describe '一覧' do
    before do
      2.times { FactoryGirl.create(:note) }
      FactoryGirl.create(:note, slug: nil)

      visit '/admin/notes'
    end

    it 'ブログ記事が3件表示されている' do
      find('table.notes tbody').all('tr').count.should == 3
    end

    it '2つ目の記事のslugが "hello-world-2" になっている' do
      find('table.notes tbody').find('tr:nth-child(2)').should have_content('hello-world-2')
    end

    it '3つ目の記事の「表示」項目が消えている' do
      find('table.notes tbody').find('tr:nth-child(3)').find('td:nth-child(6)')
        .has_css?('a').should be_false
    end
  end

  describe '編集' do
    context '非公開記事' do
      before do
        note = FactoryGirl.create(:note, slug: nil, published_at: nil)

        visit "/admin/notes/#{note.id}/edit"
      end

      context 'slugを入力して保存ボタンを押す' do
        before do
          within('#admin_notes.edit') do
            fill_in 'note_slug', with: 'hello-world'
          end

          click_button '保存'
        end

        it '記事が更新されている' do
          Note.first.slug.should == 'hello-world'
        end

        it 'published_atに日付が保存される' do
          Note.first.published_at.should_not be_nil
        end
      end
    end

    context '公開記事' do
      before do
        @note = FactoryGirl.create(:note)

        visit "/admin/notes/#{@note.id}/edit"
      end

      context '公開状態のまま' do
        context '保存ボタンを押す' do
          before do
            within('#admin_notes.edit') do
              fill_in 'note_slug', with: 'new-hello-world'
            end

            click_button '保存'
          end

          it '記事が更新されている' do
            Note.first.slug.should == 'new-hello-world'
          end

          it 'published_atの値は変化しない' do
            Note.first.published_at.should == @note.published_at
          end
        end
      end
    end
  end

  describe '削除' do
    before do
      FactoryGirl.create(:note)

      visit '/admin/notes'
    end

    context '削除ボタンを押す' do
      before do
        find('table.notes td.delete a').click
      end

      it '記事が削除される' do
        Note.count.should == 0
      end

      it '削除を知らせるflashが表示される' do
        page.find('.alert').should have_content('記事を削除しました。')
      end
    end
  end
end