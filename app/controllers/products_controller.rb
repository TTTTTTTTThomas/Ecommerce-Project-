class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews.includes(:user)
  end

  def search
    @categories = Category.all
    @products = Product.where('name LIKE ?', "%#{params[:q]}%")
    render :index
  end
end
