class AddAvatarToParcels < ActiveRecord::Migration
  def self.up
    add_attachment :parcels, :avatar
  end

  def self.down
    remove_attachment :parcels, :avatar
  end
end
