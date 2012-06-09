class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource


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
end