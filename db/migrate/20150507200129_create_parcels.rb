class CreateParcels < ActiveRecord::Migration
  def change
    create_table :parcels do |t|
      t.references :origin_address, null: false
      t.references :destination_address, null: false
      t.references :sender, null: false
      t.references :trip
      t.datetime :pickup_by, null: false
      t.datetime :deliver_by, null: false
      t.integer :weight
      t.integer :volume, null: false
      t.text :delivery_notes
      t.string :description
      t.boolean :delivered, default: false, null: false
      t.timestamps
    end
  end
end
