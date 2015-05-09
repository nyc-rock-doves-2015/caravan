class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
    session[:return_to] ||= request.referer
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
    @review = Review.create(review_params)
    if @review.save
      redirect_to session.delete(:return_to)
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
    params.require(:review).permit(:rating, :content)
  end

end
