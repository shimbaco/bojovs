class ChangeDefaultPublishedAtValueInNotes < ActiveRecord::Migration
  def change
    change_column :notes, :published_at, :date, null: false
  end
end
