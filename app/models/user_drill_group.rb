class UserDrillGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :drill_group
end
