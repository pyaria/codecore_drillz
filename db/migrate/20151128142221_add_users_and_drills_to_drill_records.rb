class AddUsersAndDrillsToDrillRecords < ActiveRecord::Migration
  def change
    add_reference :drill_records, :user, index: true, foreign_key: true
    add_reference :drill_records, :drill, index: true, foreign_key: true
  end
end
