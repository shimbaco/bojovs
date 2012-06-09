class Admin::ApplicationController < ApplicationController
  before_filter :authenticate_admin_user!

  layout 'admin'
end