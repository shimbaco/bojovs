class AddPublicToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :public, :boolean, default: false, after: :body
  end
end