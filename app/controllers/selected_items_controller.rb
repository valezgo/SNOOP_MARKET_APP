class SelectedItemsController < ApplicationController
  def index
    @selected_items = Selecteditem.where(user: current_user)
  end

  def show
    @selected_item = Selecteditem.find(params[:id])
  end

  def new
    @items = Item.find(params[:item_id])
    @selected_item = Selecteditem.all
  end

  def create
    @item = Item.find(params[:item_id])
    @selected_item = Selecteditem.new(quantity: 1, item: @item, user: current_user)
    @selected_item.save
    redirect_to item_path(@item)
  end

  def destroy
    @selected_item = Selecteditem.find(params[:id])
    @selected_item.destroy
    redirect_to selected_items_path, notice: "Selected item was successfully removed from your cart."
  end
end
