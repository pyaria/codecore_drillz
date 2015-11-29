class CreateUserDrillGroups < ActiveRecord::Migration
  def change
    create_table :user_drill_groups do |t|
      t.references :user, index: true, foreign_key: true
      t.references :drill_group, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
