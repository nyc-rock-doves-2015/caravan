class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, limit: 50, unique: true
      t.string :password_digest, null: false
      t.string :email
      t.string :phone
      t.timestamps
    end
  end
end
