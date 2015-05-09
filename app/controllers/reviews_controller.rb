class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @review = Review.new
    if params[:trip_id]
      @trip = Trip.find(params[:trip_id])
      render partial: 'new_trip_review'
    elsif params[:parcel_id]
      @parcel = Parcel.find(params[:parcel_id])
      render partial: 'new_parcel_review'
    end
  end

  def create
    review = Review.new(review_params)
    review.update_attributes(reviewer_id: current_user.id)
    if review.save
      redirect_to user_path(review.reviewee_id)
    else
      flash[:error] = trip.errors.full_messages.join('<br>')
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
