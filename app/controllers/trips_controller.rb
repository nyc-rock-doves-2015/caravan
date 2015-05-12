class TripsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @parcel = Parcel.find(params[:parcel_id])
    @trips = Trip.all_matching_parcel(@parcel)
  end

  def search
    @origin = params[:origin] if params[:origin] && !params[:origin].empty?
    @origin_latitude = params[:origin_latitude] if params[:origin_latitude] && !params[:origin_latitude].empty?
    @origin_longitude = params[:origin_longitude] if params[:origin_longitude] && !params[:origin_longitude].empty?
    @destination_latitude = params[:destination_latitude] if params[:destination_latitude] && !params[:destination_latitude].empty>
    @destination_longitude = params[:destination_longitude] if params[:destination_longitude] && !params[:destination_longitude].empty?
    @pickup_by = params[:pickup_by] if params[:pickup_by] && !params[:pickup_by].empty?
    @deliver_by = params[:deliver_by] if params[:deliver_by] && !params[:deliver_by].empty?
    @weight = params[:weight] if params[:weight] && !params[:weight].empty?
    @volume = params[:volume] if params[:volume] && !params[:volume].empty?

    @trips = Trip.search({ origin_latitude: @origin_latitude, origin_longitude: @origin_longitude, destination_latitude: @destination_latitude, destination_longitude: @destination_longitude, pickup_by: @pickup_by, deliver_by: @deliver_by, weight: @weight, volume: @volume })
  end

  def new
    @url = trips_path
    @method = :post
    @submit_btn = "Create Trip"
    @address = Address.new
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
    if @trips
      @user =  current_user
      @reviewer = true
      render '_current_user'
    end
  end

  def book
    @parcel = Parcel.find(params[:parcel_id])
    @trip = Trip.find(params[:id])
    if @parcel.update(trip: @trip)
      parcel_note = parcel_notification(@parcel)
      trip_note = trip_notification(@trip)
      @parcel.sender.notify("Your parcel is booked: Click for Details", parcel_note
      @trip.driver.notify("Your trip has a confirmed parcel booking: Click for Details", trip_note)
      @trip.available_volume -= @parcel.volume
      @trip.save
    else
      flash[:error] = @parcel.errors.full_messages.join('<br>')
      redirect_to parcel_trips_path(@parcel)
    end
  end

  private

  def origin_address_params
    params.require(:origin_address).permit(:description, :street_address, :secondary_address, :city, :state, :zip_code,:latitude, :longitude).merge(user_id: current_user.id)
  end

  def destination_address_params
    params.require(:destination_address).permit(:description, :street_address, :secondary_address, :city, :state, :zip_code,:latitude,:longitude).merge(user_id: current_user.id)
  end

  def trip_params
    params.require(:trip).permit(:leaving_at, :arriving_at, :available_volume, :max_weight, :rate, :content_restrictions, :vehicle).merge(driver_id: current_user.id)
  end
end