class Blog::Article < ActiveRecord::Base
  attr_accessible :body, :published_at, :slug, :title


  def public?
    slug.present?
  end

  def set_published_at!(params)
    self.published_at = Date.today if params[:slug].present? && published_at.blank?
  end

  def url_params
    year = published_at.year.to_s
    month = sprintf('%02d', published_at.month.to_s)
    day = sprintf('%02d', published_at.day.to_s)

    [year, month, day, slug]
  end
end