class AddPriceToWatches < ActiveRecord::Migration[7.0]
  def change
    add_column :watches, :price, :integer
  end
end
