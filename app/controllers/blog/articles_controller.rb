# coding: utf-8

class Blog::ArticlesController < ApplicationController
  def show
    date = Date.parse(params[:year] + params[:month] + params[:day])
    @article = Blog::Article.where(published_at: date).where(slug: params[:slug]).first!
  end
end