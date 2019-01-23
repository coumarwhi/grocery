require 'rails_helper'

RSpec.describe "GroceryLists", type: :request do

  describe "GET index" do
    it "responds with http success" do
      user = create(:user)
      sign_in user

      get grocery_lists_path
      expect(response).to have_http_status(:success)
    end
  end 

  describe "GET new" do
    it "responds with http success" do
      user = create(:user)
      sign_in user

      get new_grocery_list_path
      expect(response).to have_http_status(:success)
    end
  end 

  describe "POST create" do
    it "creates new list and redirects" do
      grocery_list = create(:grocery_list)
      user = create(:user)
      sign_in user

      expect {
        post grocery_lists_path, params: {grocery_list: {title: 'aa', description: 'aaaa'}}
        }.to change(GroceryList, :count).by(1)

        expect(response).to have_http_status(302)
    end  
  end 

  describe "DESTROY delete" do
    it "deletes list and redirects" do
      grocery_list = create(:grocery_list)
      user = create(:user)
      sign_in user

      expect {
        delete grocery_list_path(grocery_list.id)
      }.to change(GroceryList, :count).by(-1)

      expect(response).to have_http_status(302)
    end 
  end 

  describe "PUT update" do
    it "responds with http redirect" do
      grocery_list = create(:grocery_list)
      user = create(:user)
      sign_in user

      put grocery_list_path(grocery_list.id), params: { id: grocery_list.id, grocery_list: { title: 'bb', description: 'bbbb' }}
      expect(response).to have_http_status(302)
    end
  end
end
