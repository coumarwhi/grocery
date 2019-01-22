require 'rails_helper'

RSpec.describe "GroceryLists", type: :request do

  describe "POST create" do
    it "creates new list and redirects to list" do
      grocery_list = create(:grocery_list)
      user = create(:user)
      sign_in user

      post grocery_lists_path, params: {grocery_list: {title: 'aa', description: 'aaaa'}}

    end  
  end 
end
