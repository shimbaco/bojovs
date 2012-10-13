class Note < ActiveRecord::Base
  attr_accessible :body, :published, :published_at, :slug, :title


  validates :body, presence: true
  validates :published_at, presence: true
  validates :slug, presence: true
  validates :title, presence: true


  scope :published, -> is_admin { where(published: true) unless is_admin }


  searchable do
    text :title, :body
    boolean :published
    time :created_at
  end


  def self.find_by_url!(published_at, slug)
    where(published_at: published_at).where(slug: slug).first!
  end


  def url_params
    year = published_at.year.to_s
    month = sprintf('%02d', published_at.month.to_s)
    day = sprintf('%02d', published_at.day.to_s)

    [year, month, day, slug]
  end
end