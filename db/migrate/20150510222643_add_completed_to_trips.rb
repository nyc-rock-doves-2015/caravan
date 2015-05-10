class AddCompletedToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :completed, :boolean, default: false
  end
end
