class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :user_id
      t.string :name
      t.string :light_needs
      t.string :water_needs
      t.timestamps null: false
    end
  end
end
