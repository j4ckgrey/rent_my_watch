class AddUserReferencesToRentals < ActiveRecord::Migration[7.0]
  def change
    add_reference :rentals, :user, foreign_key: true
  end
end
