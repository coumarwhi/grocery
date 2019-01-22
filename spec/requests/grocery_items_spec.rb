require 'rails_helper'

RSpec.describe "GroceryItems", type: :request do

  describe "POST create" do
    it "creates new list and redirects to list" do
      grocery_list = create(:grocery_list)
      user = create(:user)
      sign_in user

      expect {
        post grocery_list_grocery_items_path(grocery_list.id), params: {grocery_item: {title: 'aa', description: 'aaaa'}}
      }.to change(GroceryItem, :count).by(1)
      

      expect(response).to have_http_status(302)
    end  
  end 
end
