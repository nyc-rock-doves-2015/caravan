class AddReputationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reputation, :decimal, precision: 2, scale: 1
  end
end