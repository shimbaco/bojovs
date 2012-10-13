# coding: utf-8

class NotesController < ApplicationController
  def index
    @notes = Note.published(admin_user_signed_in?).order('published_at DESC')
  end

  def search
    @notes = Note.search do
      with(:published, true) unless admin_user_signed_in?
      fulltext(params[:query])
      order_by(:created_at, :desc)
    end.results

    render 'index'
  end

  def show
    published_at = Date.parse(params[:year] + params[:month] + params[:day])
    @note = Note.published(admin_user_signed_in?).find_by_url!(published_at, params[:slug])
  end
end