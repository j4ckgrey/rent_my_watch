class RemoveNotificationsCountFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :notifications_count, :integer
  end
end
