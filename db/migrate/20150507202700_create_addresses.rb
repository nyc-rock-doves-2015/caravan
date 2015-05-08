class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user, null: false
      t.string :description
      t.string :street_address
      t.string :secondary_address
      t.string :city, null: false
      t.string :state, null: false, limit: 2
      t.string :zip_code, null: false
    end
  end
end
