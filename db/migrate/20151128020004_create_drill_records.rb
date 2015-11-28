class CreateDrillRecords < ActiveRecord::Migration
  def change
    create_table :drill_records do |t|

      t.timestamps null: false
    end
  end
end
