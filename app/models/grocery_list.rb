class GroceryList < ApplicationRecord
  belongs_to :user, optional: true 
  has_many :grocery_items, dependent: :destroy 
end
