class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :factory_id
      t.integer :order_date
      t.integer :quantity
      t.boolean :complete, :default => nil
      t.timestamps
    end
  end
end
