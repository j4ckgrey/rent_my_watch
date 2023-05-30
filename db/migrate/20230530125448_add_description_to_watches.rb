class AddDescriptionToWatches < ActiveRecord::Migration[7.0]
  def change
    add_column :watches, :description, :text
  end
end
