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

      within('#admin_notes.new') do
        fill_in 'note_title', with: 'こんにちは世界'
        fill_in 'note_body', with: 'ノートへの記録、はじめました'
      end

      click_button '保存'
    end

    it '保存できる' do
      Note.count.should == 1
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
    before do
      note = FactoryGirl.create(:note, slug: nil, published_at: nil)

      visit "/admin/notes/#{note.id}/edit"

      within('#admin_notes.edit') do
        fill_in 'note_slug', with: 'hello-world'
      end

      click_button '保存'
    end

    it '記事が更新されている' do
      Note.first.slug.should == 'hello-world'
    end
  end

  describe '公開' do
    context 'slugが空の記事を公開するとき' do
      before do
        note = FactoryGirl.create(:note, slug: nil, public: false)

        visit '/admin/notes'

        find('table.notes td a.publish').click
      end

      it '記事が公開される' do
        Note.first.public.should == true
      end

      it 'slugに5文字のランダム値が格納される' do
        Note.first.slug.length.should == 5
      end
    end

    context 'published_atが空の記事を公開するとき' do
      before do
        note = FactoryGirl.create(:note, public: false, published_at: nil)

        visit '/admin/notes'

        find('table.notes td a.publish').click
      end

      it '記事が公開される' do
        Note.first.public.should == true
      end

      it 'published_atにその日の日付が格納される' do
        Note.first.published_at.class == Date
      end
    end
  end

  describe '非公開' do
    before do
      note = FactoryGirl.create(:note, public: true)

      visit '/admin/notes'

      find('table.notes td a.unpublish').click
    end

    it '記事が非公開になる' do
      Note.first.public.should == false
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