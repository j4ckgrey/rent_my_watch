class AddUserReferencesToWatches < ActiveRecord::Migration[7.0]
  def change
    add_reference :watches, :user, foreign_key: true
  end
end
