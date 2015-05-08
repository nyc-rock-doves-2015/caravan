class ParcelsController < ActionController::Base

  def new
  end

  def create
    origin_address = Address.new(address_params_origin)
    destination_address = Address.new(address_params_dest)
    if origin_address.save && destination_address.save
      parcel = Parcel.new(parcel_params)
      parcel.update_attributes(:origin_address_id => origin_address.id, :destination_address_id => destination_address.id)
      parcel.save
      redirect_to parcel_path(parcel)
    else
      render :new
    end
  end


  private

  def address_params_origin
    params.require(:origin_address).permit(:description, :street_address, :secondary_address, :city, :state, :zip_code)
  end

  def address_params_dest
    params.require(:destination_address).permit(:description, :street_address, :secondary_address, :city, :state, :zip_code)
  end


  def parcel_params
    params.require(:parcel).permit(:origin_address_id, :destination_address_id, :sender_id, :trip_id, :pickup_by, :deliver_by, :weight, :volume, :delivery_notes, :description)
  end

end
