class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.bigint :cart_id
      t.bigint :menu_item_id
      t.bigint :quantity
    end
  end
end
