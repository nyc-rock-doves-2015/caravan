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


  private

  def origin_address_params
    params.require(:origin_address).permit(:description, :street_address, :secondary_address, :city, :state, :zip_code, :user_id)
  end

  def destination_address_params
    params.require(:destination_address).permit(:description, :street_address, :secondary_address, :city, :state, :zip_code, :user_id)
  end


  def parcel_params
    params.require(:parcel).permit(:origin_address_id, :destination_address_id, :sender_id, :trip_id, :pickup_by, :deliver_by, :weight, :volume, :delivery_notes, :description)
  end

end
