# coding: utf-8

class NotesController < ApplicationController
  def show
    date = Date.parse(params[:year] + params[:month] + params[:day])
    @note = Note.where(published_at: date).where(slug: params[:slug]).first!
  end
end