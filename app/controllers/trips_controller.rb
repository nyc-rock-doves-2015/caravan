class TripsController < ApplicationController

  def new
    current_user
  end

  def create
    trip = Trip.build(origin_address_params, destination_address_params, trip_params)

    if trip && trip.id
      redirect_to profile_path
    else
      flash[:error] = trip.errors.full_messages.join('<br>')
      # TODO: recycle params so user does not have to re-input
      render :new
    end
  end

  private

  def origin_address_params
    params.require(:origin_address).permit(:user_id, :description, :street_address, :secondary_address, :city, :state, :zip_code)
  end

  def destination_address_params
    params.require(:destination_address).permit(:user_id, :description, :street_address, :secondary_address, :city, :state, :zip_code)
  end

  def trip_params
    params.require(:trip).permit(:driver_id, :leaving_at, :arriving_at, :available_volume, :max_weight, :rate, :content_restrictions, :vehicle)
  end
end