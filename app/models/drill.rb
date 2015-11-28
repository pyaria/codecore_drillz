class Drill < ActiveRecord::Base
  belongs_to :drill_group
  belongs_to :user
end
