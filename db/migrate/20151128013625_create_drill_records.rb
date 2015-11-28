class CreateDrillRecords < ActiveRecord::Migration
  def change
    create_table :drill_records do |t|
      t.references :user, index: true, foreign_key: true
      t.references :drill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
