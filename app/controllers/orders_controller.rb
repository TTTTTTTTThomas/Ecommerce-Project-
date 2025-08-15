class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.total_price = cart_total
    @order.status = 'pending'
    if @order.save
      session[:cart].each do |product_id, quantity|
        product = Product.find(product_id)
        @order.order_items.create(product: product, quantity: quantity, price_at_order: product.price)
      end
      session[:cart] = {}
      redirect_to @order, notice: 'Order placed!'
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.all
  end

  private

  def order_params
    params.require(:order).permit(:user_id)
  end

  def initialize_cart
    session[:cart] ||= {}
  end

  def cart_total
    session[:cart].sum { |pid, qty| Product.find(pid).price * qty }
  end
end
