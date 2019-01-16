class GroceryListsChannel < ApplicationCable::Channel 
  def subscribed
    stream_from "grocery_list_#{params[:grocery_list_id]}_channel"
  end
end 