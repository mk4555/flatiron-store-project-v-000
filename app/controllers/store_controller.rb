class StoreController < ApplicationController
  def index
    current_user = User.first
    @categories = Category.all
    @items = Item.all
    @current_cart = current_user.current_cart
  end


end
