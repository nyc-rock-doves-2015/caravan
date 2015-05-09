class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :driver
      t.references :sender
      t.references :trip
      t.references :parcel
      t.integer :rating
      t.text :review
      t.timestamps null: false
    end
  end
end
