class AddUserToDrillGroup < ActiveRecord::Migration
  def change
    add_reference :drill_groups, :user, index: true, foreign_key: true
  end
end
