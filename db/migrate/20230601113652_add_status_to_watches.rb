class AddStatusToWatches < ActiveRecord::Migration[7.0]
  def change
    add_column :watches, :status, :boolean
  end
end
