class CreateWatches < ActiveRecord::Migration[7.0]
  def change
    create_table :watches do |t|
      t.string :name
      t.string :model
      t.string :brand

      t.timestamps
    end
  end
end
