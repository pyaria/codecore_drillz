class DrillComplete < ActiveRecord::Base
  belongs_to :user
  belongs_to :drill
end
