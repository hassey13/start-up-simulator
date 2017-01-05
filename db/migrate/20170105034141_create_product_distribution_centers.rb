class CreateProductDistributionCenters < ActiveRecord::Migration[5.0]
  def change
    create_table :product_distribution_centers do |t|
      t.integer :distribution_center_id
      t.integer :product_id
      t.integer :quantity
      t.timestamps
    end
  end
end
