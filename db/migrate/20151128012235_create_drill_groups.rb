class CreateDrillGroups < ActiveRecord::Migration
  def change
    create_table :drill_groups do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.string :description
      t.integer :level
      t.references :badgings, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
