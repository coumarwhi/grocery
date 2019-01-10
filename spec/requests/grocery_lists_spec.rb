require 'rails_helper'

RSpec.describe "GroceryLists", type: :request do
  describe "GET /grocery_lists" do
    it "works! (now write some real specs)" do
      get grocery_lists_path
      expect(response).to have_http_status(200)
    end
  end
end
