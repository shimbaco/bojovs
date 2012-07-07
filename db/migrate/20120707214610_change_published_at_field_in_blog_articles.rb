class ChangePublishedAtFieldInBlogArticles < ActiveRecord::Migration
  def change
    change_column(:blog_articles, :published_at, :date)
  end
end