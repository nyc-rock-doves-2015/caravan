class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @review = Review.new
    @review_carrier = Trip.find(params[:trip_id]) if params[:trip_id]
    @review_carrier = Parcel.find(params[:parcel_id]) if params[:parcel_id]
  end

  def create
    review = Review.new(review_params)
    review.update_attributes(reviewer_id: current_user.id)
    reviewee = User.find(review.reviewee_id)
    if review.save
      reviewee.update_attributes(reputation: review.rating.to_f)
      redirect_to user_path(reviewee.id)
    else
      flash[:error] = review.errors.full_messages.join('<br>')
      @review = Review.new
      @review_carrier = Trip.find(params[:trip_id]) if params[:trip_id]
      @review_carrier = Parcel.find(params[:parcel_id]) if params[:parcel_id]
      render :new
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to current_user_profile
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :trip_id, :parcel_id, :reviewee_id)
  end

end
