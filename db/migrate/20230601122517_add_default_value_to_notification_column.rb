class AddDefaultValueToNotificationColumn < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :notification, 0
  end
end
