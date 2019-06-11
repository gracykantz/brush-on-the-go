class ReviewsController < ApplicationController
  def create
    @review = current_user.reviews.build(review_params)
    @reviews = Review.where("product_id = ?", params[:product_id])

    if @review.save
      redirect_to product_path(@review.product) # review_path(@review)
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :product_id)
  end
end
