class CreateBlogArticles < ActiveRecord::Migration
  def change
    create_table :blog_articles do |t|
      t.string :slug
      t.string :title, null: false
      t.text :body, null: false
      t.datetime :published_at
      t.timestamps
    end

    add_index :blog_articles, :slug
  end
end