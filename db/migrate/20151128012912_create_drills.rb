class CreateDrills < ActiveRecord::Migration
  def change
    create_table :drills do |t|
      t.string :name
      t.references :drill_group, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :description
      t.string :points
      t.string :integer

      t.timestamps null: false
    end
  end
end
