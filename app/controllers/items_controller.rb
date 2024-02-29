class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def new
    @item = Item.new

  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to item_path(@item), notice: 'Item created!'
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :quantity, :price, :category_id, :photo)
  end

end
