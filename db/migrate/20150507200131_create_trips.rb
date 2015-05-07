class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.references :origin_address, null: false
      t.references :destination_address, null: false
      t.references :driver, null: false
      t.datetime :leaving_at, null: false
      t.datetime :arriving_at, null: false
      t.integer :available_volume, null: false
      t.integer :max_weight
      t.decimal :rate, null: false, precision: 8, scale: 2
      t.text :content_restrictions
      t.string :vehicle

      t.timestamps
    end
  end
end
