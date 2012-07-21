class RenameArticlesToNotes < ActiveRecord::Migration
  def change
    rename_table :articles, :notes
  end
end