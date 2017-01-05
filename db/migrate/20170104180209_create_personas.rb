class CreatePersonas < ActiveRecord::Migration[5.0]
  def change
    create_table :personas do |t|
      t.string :name
      t.integer :money
      t.integer :user_id
      t.integer :level
      t.integer :current_date
      t.timestamps
    end
  end
end
