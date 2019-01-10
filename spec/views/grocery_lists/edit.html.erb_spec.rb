require 'rails_helper'

RSpec.describe "grocery_lists/edit", type: :view do
  before(:each) do
    @grocery_list = assign(:grocery_list, GroceryList.create!(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit grocery_list form" do
    render

    assert_select "form[action=?][method=?]", grocery_list_path(@grocery_list), "post" do

      assert_select "input[name=?]", "grocery_list[title]"

      assert_select "textarea[name=?]", "grocery_list[description]"
    end
  end
end
