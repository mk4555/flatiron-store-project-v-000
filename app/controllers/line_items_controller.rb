class LineItemsController < ApplicationController
  def create
    if current_user.current_cart == nil
      cart = Cart.create(user_id: current_user.id)
      cart.add_item(params[:item_id]).save
      current_user.carts << cart
      current_user.current_cart = cart
      current_user.save
    else
      cart = current_user.current_cart
      cart.add_item(params[:item_id])
      current_user.save
    end
    redirect_to cart_path(cart)
  end
end
