class AddDrillGroupAndBadgeToBadgings < ActiveRecord::Migration
  def change
    add_reference :badgings, :drill_group, index: true, foreign_key: true
    add_reference :badgings, :badge, index: true, foreign_key: true
  end
end
