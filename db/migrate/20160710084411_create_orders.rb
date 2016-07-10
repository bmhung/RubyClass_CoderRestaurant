class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :menu_item, foreign_key: true
      t.string :name
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
