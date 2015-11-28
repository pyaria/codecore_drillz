class AddDrillGroupToDrill < ActiveRecord::Migration
  def change
    add_reference :drills, :drill_group, index: true, foreign_key: true
  end
end
