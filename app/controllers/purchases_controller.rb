class PurchasesController < ApplicationController
  def new
    @purchase = Purchase.new
    @selected_items = Selecteditem.where(user: current_user)
    @total_price = 0
    @selected_items.each do |selected_item|
      @total_price += selected_item.quantity * selected_item.item.price
    end
  end

  def create
  end
end
