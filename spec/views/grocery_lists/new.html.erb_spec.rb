require 'rails_helper'

RSpec.describe "grocery_lists/new", type: :view do
  before(:each) do
    assign(:grocery_list, GroceryList.new(
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new grocery_list form" do
    render

    assert_select "form[action=?][method=?]", grocery_lists_path, "post" do

      assert_select "input[name=?]", "grocery_list[title]"

      assert_select "textarea[name=?]", "grocery_list[description]"
    end
  end
end
