class CartsController < ApplicationController
  before_action :initialize_cart

  def show
    @cart_items = cart_items
  end

  def add
    id = params[:product_id].to_s
    session[:cart][id] ||= 0
    session[:cart][id] += params[:quantity].to_i
    redirect_to cart_path, notice: 'Added to cart.'
  end

  def remove
    id = params[:product_id].to_s
    session[:cart].delete(id)
    redirect_to cart_path, notice: 'Removed from cart.'
  end

  def update
    id = params[:product_id].to_s
    session[:cart][id] = params[:quantity].to_i
    redirect_to cart_path, notice: 'Cart updated.'
  end

  private

  def initialize_cart
    session[:cart] ||= {}
  end

  def cart_items
    Product.find(session[:cart].keys).map do |product|
      { product: product, quantity: session[:cart][product.id.to_s] }
    end
  end
end
