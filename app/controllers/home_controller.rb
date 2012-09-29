class HomeController < ApplicationController
  def index
    @notes = Note.order('published_at DESC').limit(5)
  end
end
