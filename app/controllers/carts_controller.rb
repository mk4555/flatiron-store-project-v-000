class CartsController < ApplicationController
  before_action :set_cart
  def show

  end

  def checkout
    @current_cart.line_items.each do |item|
      cart_item = Item.find_by_id(item.id)
      cart_item.update(inventory: cart_item.inventory - item.quantity)
    end

    current_user.current_cart = nil
    current_user.save
    redirect_to cart_path(@current_cart)
  end

  private

  def set_cart
    if user_signed_in? && current_user.current_cart != nil
      @current_cart = current_user.current_cart
    end
  end
end
