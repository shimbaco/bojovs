class HomeController < ApplicationController
  def index
    @notes = Note.published(admin_user_signed_in?).order('published_at DESC').limit(5)
  end
end
