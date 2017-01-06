class AddDemandToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :demand, :integer
  end
end
