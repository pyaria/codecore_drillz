class CreateDrills < ActiveRecord::Migration
  def change
    create_table :drills do |t|
      t.string :name
      t.string :description
      t.integer :points

      t.timestamps null: false
    end
  end
end
