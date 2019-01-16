class AddCompletedAtGroceryItems < ActiveRecord::Migration[5.1]
  def change
    add_column :grocery_items, :completed, :boolean, default: false
  end
end
