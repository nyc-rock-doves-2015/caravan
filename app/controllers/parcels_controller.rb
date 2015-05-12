class ParcelsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @trip = Trip.find(params[:trip_id])
    @parcels = @trip.parcels
  end

  def new
    @url = parcels_path
    @method = :post
    @submit_btn = "Create Parcel"
    @address = Address.new
  end

  def show
    @parcel = Parcel.find(params[:id])
  end

  def create
    parcel = Parcel.build(origin_address_params, destination_address_params, parcel_params)

    if parcel && parcel.persisted?
      redirect_to profile_path
    else
      flash[:error] = parcel.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @parcel = Parcel.find(params[:id])
    @origin_address = @parcel.origin_address
    @destination_address = @parcel.destination_address
    @url = parcel_path(@parcel)
    @method = :put
    @submit_btn = "Update Parcel"
  end

  def update
    @parcel = Parcel.find(params[:id])
    @origin_address = @parcel.origin_address
    @destination_address = @parcel.destination_address
    if @parcel.update(parcel_params) && @origin_address.update(origin_address_params) && @destination_address.update(destination_address_params)
      @parcel.trip.update_attributes(completed: true) if @parcel.delivered
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    parcel = Parcel.find(params[:id])
    parcel.destroy
    redirect_to user_path(current_user.id)
  end
  def match_reviewer
    @parcels = Parcel.match_reviewer(params[:id], current_user.id)
    if @parcels
      @user =  current_user
      @reviewer = true
      render '_current_user'
    end
  end

  private

  def origin_address_params
    params.require(:origin_address).permit(:user_id, :description, :street_address, :secondary_address, :city, :state, :zip_code).merge(user_id: current_user.id)
  end

  def destination_address_params
    params.require(:destination_address).permit(:user_id, :description, :street_address, :secondary_address, :city, :state, :zip_code).merge(user_id: current_user.id)
  end

  def parcel_params
    params.require(:parcel).permit(:origin_address_id, :destination_address_id, :sender_id, :trip_id, :pickup_by, :deliver_by, :weight, :volume, :delivery_notes, :description, :delivered, :avatar).merge(sender_id: current_user.id)
  end

end
