class Note < ActiveRecord::Base
  attr_accessible :body, :published, :published_at, :slug, :title


  validates :body, presence: true
  validates :published_at, presence: true
  validates :slug, presence: true
  validates :title, presence: true


  searchable do
    text :title, :body
    time :created_at
  end


  def url_params
    year = published_at.year.to_s
    month = sprintf('%02d', published_at.month.to_s)
    day = sprintf('%02d', published_at.day.to_s)

    [year, month, day, slug]
  end
end