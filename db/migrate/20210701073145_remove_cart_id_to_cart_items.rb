class RemoveCartIdToCartItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :cart_items, :cart_id
    change_column :order_items, :price, :decimal
    change_column :menu_items, :price, :decimal
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
