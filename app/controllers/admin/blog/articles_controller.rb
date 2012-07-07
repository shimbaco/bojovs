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

    @article.set_published_at!(params[:blog_article])

    if @article.save
      flash[:notice] = '記事を作成しました。'
      redirect_to admin_blog_articles_path
    end
  end

  def edit
    @article = ::Blog::Article.find(params[:id])
  end

  def update
    @article = ::Blog::Article.find(params[:id])

    @article.set_published_at!(params[:blog_article])

    if @article.update_attributes(params[:blog_article])
      flash[:notice] = '記事を更新しました。'
      redirect_to admin_blog_articles_path
    end
  end

  def destroy
    @article = ::Blog::Article.find(params[:id])

    @article.destroy

    flash[:notice] = '記事を削除しました。'
    redirect_to admin_blog_articles_path
  end
end