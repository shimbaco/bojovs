# coding: utf-8

class ArticlesController < ApplicationController
  def show
    date = Date.parse(params[:year] + params[:month] + params[:day])
    @article = Article.where(published_at: date).where(slug: params[:slug]).first!
  end
end