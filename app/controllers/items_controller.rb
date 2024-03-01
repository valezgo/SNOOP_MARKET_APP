class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

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
 
  def index
    @items = Item.all
    if params[:query].present?
      sql_subquery = <<~SQL
        items.name @@ :query
        OR items.description @@ :query
        OR categories.name @@ :query
      SQL
      @items = @items.joins(:category).where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :quantity, :price, :category_id, :photo)
  end
end
