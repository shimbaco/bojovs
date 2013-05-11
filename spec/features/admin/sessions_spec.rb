# coding: utf-8

require 'spec_helper'

feature 'ログイン処理' do
  before do
    FactoryGirl.create(:admin)

    visit '/admin/users/signin'
  end

  context 'ログインボタンを押す' do
    before do
      within('#admin_sessions.new') do
        fill_in 'admin_user_email', with: 'bojovs@gmail.com'
        fill_in 'admin_user_password', with: 'svojob'
      end

      click_button 'ログイン'
    end

    it 'ログインできる' do
      visit '/admin'
      
      page.should have_content('ログイン成功')
    end
  end
end