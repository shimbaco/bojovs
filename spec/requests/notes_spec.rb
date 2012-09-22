# coding: utf-8

require 'spec_helper'

describe 'ノート' do
  describe '詳細' do
    before do
      FactoryGirl.create(:note, published_at: '2012/06/01')
      FactoryGirl.create(:note, published_at: '2012/07/01')
    end

    it '記事が表示される' do
      visit '/2012/06/01/hello-world-1'

      page.find('body').should have_content('Hello World 1')
    end

    it '404を返す' do
      visit '/2012/06/01/hello-world-2'
      
      page.status_code.should == 404
    end
  end
end