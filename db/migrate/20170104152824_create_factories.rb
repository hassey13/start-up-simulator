class CreateFactories < ActiveRecord::Migration[5.0]
  def change
    create_table :factories do |t|
      t.string :name
      t.float :production_rating
      t.float :quality_rating
      t.float :cost_rating
      t.boolean :availability
      t.timestamps
    end
  end
end
