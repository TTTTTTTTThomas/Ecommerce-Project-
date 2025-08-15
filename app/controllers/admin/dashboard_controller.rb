class Admin::DashboardController < ApplicationController
	before_action :require_admin

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admin_dashboard_index_path, notice: 'Product created.'
		else
			render :new
		end
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to admin_dashboard_index_path, notice: 'Product updated.'
		else
			render :edit
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to admin_dashboard_index_path, notice: 'Product deleted.'
	end

	private

	def require_admin
		unless session[:admin_id] && Admin.find_by(id: session[:admin_id])
			redirect_to new_session_path, alert: 'Please log in as admin.'
		end
	end

	def product_params
		params.require(:product).permit(:name, :description, :price, :stock_quantity, :category_id)
	end
end
