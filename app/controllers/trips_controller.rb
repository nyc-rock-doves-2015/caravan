class TripsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @parcel = Parcel.find(params[:parcel_id])
    @trips = Trip.all_matching_parcel(@parcel)
  end

  def new
    @url = trips_path
    @method = :post
    @submit_btn = "Create Trip"
  end

  def show
    @trip = Trip.find(params[:id])
  end

  def edit
    @trip = Trip.find(params[:id])
    @origin_address = @trip.origin_address
    @destination_address = @trip.destination_address
    @url = trip_path
    @method = :put
    @submit_btn = "Update Trip"
  end

  def update
    @trip = Trip.find(params[:id])
    @origin_address = @trip.origin_address
    @destination_address = @trip.destination_address

    if @trip.update(trip_params)
      @trip.origin_address.update(origin_address_params)
      @trip.destination_address.update(destination_address_params)
      redirect_to current_user_profile
    else
      render :edit
    end
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
    redirect_to current_user_profile
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
  def match_reviewer
    @trips = Trip.match_reviewer(params[:id], current_user.id)
    p @trips
    if @trips
      @user =  current_user
      render '_current_user', locals: {reviewer: true}
    end
  end

  def book
    @parcel = Parcel.find(params[:parcel_id])
    @trip = Trip.find(params[:id])
    if @parcel.update(trip: @trip)
      @trip.available_volume -= @parcel.volume
      @trip.save
    else
      flash[:error] = @parcel.errors.full_messages.join('<br>')
      redirect_to parcel_trips_path(@parcel)
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