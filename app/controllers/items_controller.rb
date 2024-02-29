class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end
end
