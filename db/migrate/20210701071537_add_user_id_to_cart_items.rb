class AddUserIdToCartItems < ActiveRecord::Migration[6.1]
  def change
    add_column :cart_items, :user_id, :bigint
    change_column :cart_items, :quantity, :integer
    change_column :order_items, :quantity, :integer
#Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
