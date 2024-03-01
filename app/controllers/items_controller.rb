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
    if @item.save
      redirect_to item_path(@item), notice: 'Item created!'
    else
      render :new, status: :unprocessable_entity
    end
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item), notice: 'Item updated!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path, notice: 'Item deleted'
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :quantity, :price, :category_id, :photo)
  end
end
