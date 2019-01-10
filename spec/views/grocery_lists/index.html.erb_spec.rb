require 'rails_helper'

RSpec.describe "grocery_lists/index", type: :view do
  before(:each) do
    assign(:grocery_lists, [
      GroceryList.create!(
        :title => "Title",
        :description => "MyText"
      ),
      GroceryList.create!(
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of grocery_lists" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
