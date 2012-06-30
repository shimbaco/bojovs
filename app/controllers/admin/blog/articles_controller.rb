# coding: utf-8

class Admin::Blog::ArticlesController < Admin::ApplicationController
  def index
    @articles = ::Blog::Article.all
  end

  def new
    @article = ::Blog::Article.new
  end

  def create
    @article = ::Blog::Article.new(params[:blog_article])

    if @article.save
      redirect_to admin_blog_articles_path
    end
  end

  def edit
    @article = ::Blog::Article.find(params[:id])
  end

  def update
    @article = ::Blog::Article.find(params[:id])

    if @article.update_attributes(params[:blog_article])
      flash[:notice] = '保存しました。'

      redirect_to admin_blog_articles_path
    end
  end
end