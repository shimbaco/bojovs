# coding: utf-8

class Admin::Blog::ArticlesController < Admin::ApplicationController
  def index
    @articles = ::Blog::Article.all
  end

  def new
    @blog_article = ::Blog::Article.new
  end

  def create
    @blog_article = ::Blog::Article.new(params[:blog_article])

    if @blog_article.save
      redirect_to admin_blog_articles_path
    end
  end
end