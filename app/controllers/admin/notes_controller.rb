# coding: utf-8

class Admin::NotesController < Admin::ApplicationController
  def index
    @notes = ::Note.all
  end

  def new
    @note = ::Note.new
  end

  def create
    @note = ::Note.new(params[:note])

    if @note.save
      flash[:notice] = '記事を作成しました。'

      return redirect_to admin_notes_path
    end

    render :new
  end

  def edit
    @note = ::Note.find(params[:id])
  end

  def update
    @note = ::Note.find(params[:id])

    if @note.update_attributes(params[:note])
      flash[:notice] = '記事を更新しました。'

      return redirect_to admin_notes_path
    end
  end

  def destroy
    @note = ::Note.find(params[:id])

    @note.destroy

    flash[:notice] = '記事を削除しました。'
    redirect_to admin_notes_path
  end
end