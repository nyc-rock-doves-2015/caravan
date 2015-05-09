class ReviewsController < ApplicationController

  def new
    session[:return_to] ||= request.referer
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
    params.require(:review).permit(:trip_id, :parcel_id, :rating, :content)
  end

end
