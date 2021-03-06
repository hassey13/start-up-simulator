class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.integer :persona_id
      t.integer :sell_price
      t.integer :demand
      t.text :picture
      t.boolean :active
      t.integer :date_created
      t.timestamps
    end
  end
end
