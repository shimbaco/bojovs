class Blog::Article < ActiveRecord::Base
  attr_accessible :body, :published_at, :slug, :title


  def published?
    published_at.present?
  end

  def set_published_at!(params)
    if params[:slug].present? && published_at.blank?
      self.published_at = DateTime.now

      return
    elsif params[:slug].blank? && published_at.present?
      self.published_at = nil

      return
    end
  end

  def url_params
    year = published_at.year.to_s
    month = sprintf('%02d', published_at.month.to_s)
    day = sprintf('%02d', published_at.day.to_s)

    [year, month, day, slug]
  end
end