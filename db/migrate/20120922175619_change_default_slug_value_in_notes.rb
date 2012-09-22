class ChangeDefaultSlugValueInNotes < ActiveRecord::Migration
  def change
    change_column :notes, :slug, :string, null: false
  end
end
