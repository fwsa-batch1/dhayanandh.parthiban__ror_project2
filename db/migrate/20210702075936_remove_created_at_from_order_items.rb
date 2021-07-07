class RemoveCreatedAtFromOrderItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :created_at
    remove_column :orders, :updated_at
    add_column :orders, :created_at, :timestamp
    add_column :orders, :updated_at, :timestamp
  end
end
