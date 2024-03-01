class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
    @selected_items = Selecteditem.where(user: current_user)
  end

  def create
  end
end
