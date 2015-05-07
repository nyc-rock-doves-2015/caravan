class ParcelController < ActionController::Base

  def new
    @origin_address = Address.new
    @destination_address = Address.new
    @parcel = Parcel.new
  end

  def create
    # @parcel = Parcel.new(parcel_params)
    # if @parcel.save
    #   redirect_to parcel_path(@parcel)
    # else
    #   render :new
    # end
  end


  private

  def parcel_params
    params.require(:parcel).permit(:origin_address_id, :destination_address_id, :sender_id, :trip_id, :pickup_by, :deliver_by, :weight, :volume, :delivery_notes, :description)
  end

end
