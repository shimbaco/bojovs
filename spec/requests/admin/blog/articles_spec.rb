# coding: utf-8

require 'spec_helper'

feature '記事投稿処理' do
  before do
    admin = FactoryGirl.create(:admin)

    login_as(admin)

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