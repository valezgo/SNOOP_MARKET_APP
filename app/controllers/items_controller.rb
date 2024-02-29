class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]

  def show
    @item = Item.find(params[:id])
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
end
