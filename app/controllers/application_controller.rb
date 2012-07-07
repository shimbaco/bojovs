class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource

  rescue_from ActiveRecord::RecordNotFound, with: :not_found


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

  def not_found
    render text: '404 Not Found', status: 404
  end
end