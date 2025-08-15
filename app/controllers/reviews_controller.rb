class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.user_id = session[:user_id]
    if @review.save
      redirect_to product_path(@review.product_id), notice: 'Review added.'
    else
      redirect_to product_path(@review.product_id), alert: 'Failed to add review.'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    product_id = @review.product_id
    @review.destroy
    redirect_to product_path(product_id), notice: 'Review deleted.'
  end

  private

  def review_params
    params.require(:review).permit(:product_id, :rating, :comment)
  end
end
