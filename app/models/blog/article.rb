class Blog::Article < ActiveRecord::Base
  attr_accessible :body, :published_at, :slug, :title


  def published?
    published_at.present?
  end

  def url_params
    year = published_at.year.to_s
    month = sprintf('%02d', published_at.month.to_s)
    day = sprintf('%02d', published_at.day.to_s)

    [year, month, day, slug]
  end
end