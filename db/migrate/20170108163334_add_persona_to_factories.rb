class AddPersonaToFactories < ActiveRecord::Migration[5.0]
  def change
    add_column :factories, :cost, :integer
    add_column :factories, :persona_id, :integer
  end
end
