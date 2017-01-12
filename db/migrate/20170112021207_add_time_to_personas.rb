class AddTimeToPersonas < ActiveRecord::Migration[5.0]
  def change
    add_column :personas, :game_time, :integer, default: 1
  end
end
