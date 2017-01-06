class CreateDistributionCenters < ActiveRecord::Migration[5.0]
  def change
    create_table :distribution_centers do |t|
      t.string :name
      t.integer :city_id
      t.integer :capacity
      t.integer :persona_id
      t.integer :date_created
      t.timestamps
    end
  end
end
