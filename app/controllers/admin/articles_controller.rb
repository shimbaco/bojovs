# coding: utf-8

class Admin::ArticlesController < Admin::ApplicationController
  def index
    @articles = ::Article.all
  end

  def new
    @article = ::Article.new
  end

  def create
    @article = ::Article.new(params[:article])

    @article.set_published_at!(params[:article])

    if @article.save
      flash[:notice] = '記事を作成しました。'
      redirect_to admin_articles_path
    end
  end

  def edit
    @article = ::Article.find(params[:id])
  end

  def update
    @article = ::Article.find(params[:id])

    @article.set_published_at!(params[:article])

    if @article.update_attributes(params[:article])
      flash[:notice] = '記事を更新しました。'
      redirect_to admin_articles_path
    end
  end

  def destroy
    @article = ::Article.find(params[:id])

    @article.destroy

    flash[:notice] = '記事を削除しました。'
    redirect_to admin_articles_path
  end
end