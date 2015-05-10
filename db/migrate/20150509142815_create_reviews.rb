class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :trip
      t.references :parcel
      t.references :reviewer, null: false
      t.references :reviewee, null: false
      t.integer :rating, null: false
      t.text :content, null: false
      t.timestamps null: false
    end
  end
end