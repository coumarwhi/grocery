class GroceryListsController < ApplicationController
  before_action :set_grocery_list, only: [:show, :edit, :update, :destroy]


  def index
    @grocery_lists = GroceryList.all
  end

  def show
  end

  def new
    @grocery_list = GroceryList.new
  end

  def create
    @grocery_list = GroceryList.new(grocery_list_params)
    @grocery_list.user = current_user

    respond_to do |format|
      if @grocery_list.save
        format.html { redirect_to @grocery_list, notice: 'Grocery list was successfully created.' }
        format.json { render :show, status: :created, location: @grocery_list }
      else
        format.html { render :new }
        format.json { render json: @grocery_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   respond_to do |format|
  #     if @grocery_list.update(grocery_list_params)
  #       format.html { redirect_to @grocery_list, notice: 'Grocery list was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @grocery_list }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @grocery_list.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def destroy
    @grocery_list.destroy
    respond_to do |format|
      format.html { redirect_to grocery_lists_url, notice: 'Grocery list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_grocery_list
      @grocery_list = GroceryList.find(params[:id])
    end

    def grocery_list_params
      params.require(:grocery_list).permit(:title, :description)
    end
end
