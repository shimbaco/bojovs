class Admin::User < ActiveRecord::Base
  # :confirmable, :lockable, :omniauthable, :recoverable, :registerable,
  # :rememberable, :token_authenticatable, :timeoutable, :validatable
  devise :database_authenticatable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
    :username
end