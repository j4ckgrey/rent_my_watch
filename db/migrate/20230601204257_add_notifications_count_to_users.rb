class AddNotificationsCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :notifications_count, :integer, default: 0
    add_index :users, :notifications_count
  end
end

