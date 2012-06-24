class Blog::Article < ActiveRecord::Base
  attr_accessible :body, :published_at, :slug, :title
end