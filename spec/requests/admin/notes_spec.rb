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
        fill_in 'note_slug', with: 'hello-world'
        select '2012', from: 'note_published_at_1i'
        select 'September', from: 'note_published_at_2i'
        select '23', from: 'note_published_at_3i'
      end

      click_button '保存'
    end

    it '保存できる' do
      Note.count.should == 1
    end

    it 'published_atに作成日が保存される' do
      Note.first.published_at.should == Date.today
    end
  end

  describe '一覧' do
    before do
      2.times { FactoryGirl.create(:note) }
      FactoryGirl.create(:note)

      visit '/admin/notes'
    end

    it 'ブログ記事が3件表示されている' do
      find('table.notes tbody').all('tr').count.should == 3
    end

    it '2つ目の記事のタイトルが "Hello World 2" になっている' do
      find('table.notes tbody').find('tr:nth-child(2)').should have_content('Hello World 2')
    end
  end

  describe '編集' do
    before do
      note = FactoryGirl.create(:note)

      visit "/admin/notes/#{note.id}/edit"

      within('#admin_notes.edit') do
        fill_in 'note_slug', with: 'new-hello-world'
      end

      click_button '保存'
    end

    it '記事が更新されている' do
      Note.first.slug.should == 'new-hello-world'
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