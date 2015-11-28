class Badging < ActiveRecord::Base
  belongs_to :badge
  belongs_to :drill_group
end
