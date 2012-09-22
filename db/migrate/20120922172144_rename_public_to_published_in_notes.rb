class RenamePublicToPublishedInNotes < ActiveRecord::Migration
  def change
    rename_column :notes, :public, :published
  end
end
