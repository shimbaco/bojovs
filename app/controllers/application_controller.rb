class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource

  rescue_from ActiveRecord::RecordNotFound, with: :render_404


  private

  def after_sign_in_path_for(resource)
    admin_root_path
  end

  def layout_by_resource
    if devise_controller?
      'admin'
    else
      'application'
    end
  end

  def render_404
    render file: Rails.root.join('public', '404'), layout: false, status: 404
  end
end