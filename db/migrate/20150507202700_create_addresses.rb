class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :description
      t.string :street_address
      t.string :secondary_address
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false
    end
  end
end
