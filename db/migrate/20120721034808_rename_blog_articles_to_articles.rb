class RenameBlogArticlesToArticles < ActiveRecord::Migration
  def change
    rename_table :blog_articles, :articles
  end
end