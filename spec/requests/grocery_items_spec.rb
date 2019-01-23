require 'rails_helper'

RSpec.describe "GroceryItems", type: :request do

  describe "POST create" do
    it "creates new item and redirects" do
      grocery_list = create(:grocery_list)
      user = create(:user)
      sign_in user

      expect {
        post grocery_list_grocery_items_path(grocery_list.id), params: {grocery_item: {title: 'aa', description: 'aaaa'}}
      }.to change(GroceryItem, :count).by(1)
      

      expect(response).to have_http_status(302)
    end  
  end 

  describe "DELETE destroy" do
    it "deletes item and redirects" do
       grocery_list = create(:grocery_list)  
       user = create(:user)
       grocery_item = create(:grocery_item, grocery_list: grocery_list)
       sign_in user
       
       expect {
         delete grocery_list_grocery_item_path(grocery_list.id, grocery_item.id)
    }.to change(GroceryItem, :count).by(-1)

      expect(response).to have_http_status(302)
    end 
  end 

 
end
