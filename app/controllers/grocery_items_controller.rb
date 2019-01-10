class GroceryItemsController < ApplicationController
  before_action :set_grocery_list

  def create
    @grocery_item = @grocery_list.grocery_items.create(grocery_item_params)
    redirect_to @grocery_list 
  end 

  def destroy
    @grocery_item = @grocery_list.grocery_items.find(params[:id])
    if @grocery_item.destroy
    end
    redirect_to @grocery_list 
   end

  private

  def set_grocery_list
    @grocery_list = GroceryList.find(params[:grocery_list_id])
  end 

  def grocery_item_params
    params[:grocery_item].permit(:content)
  end 

end
