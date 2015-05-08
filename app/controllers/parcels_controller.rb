class ParcelsController < ActionController::Base

  def create
    parcel = Parcel.build(origin_address_params, destination_address_params, parcel_params)

    if parcel && parcel.id
      redirect_to profile_path
    else
      flash[:error] = parcel.errors.full_messages.join('<br>')
      render :new
    end
  end

  def edit
    @parcel = parcel.find(params[:id])
  end

  def update
    @parcel = Parcel.find(params[:id])
    if @parcel.update_attributes(parcel_params)
      redirect_to post_path(@parcel)
    else
      render :edit
    end
  end

  def destroy
    parcel = Parcel.find(params[:id])
    parcel.destroy
    redirect_to parcels_path
  end

  private

  def origin_address_params
    params.require(:origin_address).permit(:user_id, :description, :street_address, :secondary_address, :city, :state, :zip_code)
  end

  def destination_address_params
    params.require(:destination_address).permit(:user_id, :description, :street_address, :secondary_address, :city, :state, :zip_code)
  end

  def parcel_params
    params.require(:parcel).permit(:origin_address_id, :destination_address_id, :sender_id, :trip_id, :pickup_by, :deliver_by, :weight, :volume, :delivery_notes, :description)
  end

end
