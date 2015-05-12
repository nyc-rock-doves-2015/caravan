class AddReviewedToTripsAndParcels < ActiveRecord::Migration
  def change
    add_column :trips, :reviewed, :boolean, default: false
    add_column :parcels, :reviewed, :boolean, default: false
  end
end
