class AddTimestampsToOrders < ActiveRecord::Migration[6.1]
  def change
      add_column :orders, :created_at, :timestamp
      add_column :orders, :updated_at, :timestamp
  end
end
