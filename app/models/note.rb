class Note < ActiveRecord::Base
  attr_accessible :body, :published_at, :slug, :title


  def url_params
    year = published_at.year.to_s
    month = sprintf('%02d', published_at.month.to_s)
    day = sprintf('%02d', published_at.day.to_s)

    [year, month, day, slug]
  end

  def make_public
    self.slug = Digest::SHA256.hexdigest(created_at.to_s)[0..4] unless slug?
    self.public = true
    self.published_at = Date.today unless published_at?

    self.save
  end

  def make_private
    update_attribute(:public, false)
  end
end