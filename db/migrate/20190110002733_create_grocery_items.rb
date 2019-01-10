class CreateGroceryItems < ActiveRecord::Migration[5.1]
  def change
    create_table :grocery_items do |t|
      t.string :content
      t.references :grocery_list, foreign_key: true

      t.timestamps
    end
  end
end
