class AddNotificationToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :notification, :integer
  end
end
