class GroceryItemsController < ApplicationController
  before_action :set_grocery_list
  before_action :set_grocery_item, except: [:create]


  def create
    @grocery_item = @grocery_list.grocery_items.create(grocery_item_params)
    ActionCable.server.broadcast("grocery_list_#{@grocery_list.id}_channel", id: @grocery_item.id, content: @grocery_item.content, type: "create")
    redirect_to @grocery_list 
  end 

  def destroy
    @grocery_item = @grocery_list.grocery_items.find(params[:id])
    ActionCable.server.broadcast("grocery_list_#{@grocery_list.id}_channel", content: @grocery_item.content, id: @grocery_item.id, type: "destroy")
    if @grocery_item.destroy
    end
    redirect_to @grocery_list 
   end

   def update
    @grocery_item = GroceryItem.find(params[:id])
    @grocery_item.assign_attributes(grocery_item_params)
      if @grocery_item.save
        ActionCable.server.broadcast("grocery_list_#{@grocery_list.id}_channel", id: @grocery_item.id, content: @grocery_item.content, type: "update")
        redirect_to [@grocery_list]
      end 
   end 

   def edit
    @grocery_item = GroceryItem.find(params[:id])
   end 

   def complete
    @grocery_item = GroceryItem.find(params[:id])
    @grocery_item.toggle(:completed).save
    if @grocery_item.completed 
      ActionCable.server.broadcast("grocery_list_#{@grocery_list.id}_channel", id: @grocery_item.id, type: "complete")
    else
      ActionCable.server.broadcast("grocery_list_#{@grocery_list.id}_channel", id: @grocery_item.id, type: "incomplete")
    end 
    redirect_to @grocery_list
   end

  private

  def set_grocery_list
    @grocery_list = GroceryList.find(params[:grocery_list_id])
  end 

  def grocery_item_params
    params.require(:grocery_item).permit(:content, :completed)
  end 

  def set_grocery_item
    @grocery_item = @grocery_list.grocery_items.find(params[:id])
   end

end
