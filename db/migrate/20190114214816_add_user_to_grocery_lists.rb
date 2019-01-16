class AddUserToGroceryLists < ActiveRecord::Migration[5.1]
  def change
    add_reference :grocery_lists, :user, foreign_key: true
  end
end
