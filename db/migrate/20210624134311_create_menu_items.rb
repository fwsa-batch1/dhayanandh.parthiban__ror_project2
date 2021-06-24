class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.bigint :menu_category_id
      t.string :name
      t.string :description
      t.string :price
      t.boolean :status

      t.timestamps
    end
  end
end
