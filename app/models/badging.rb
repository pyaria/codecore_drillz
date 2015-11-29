class Badging < ActiveRecord::Base
  belongs_to :drill_group
  belongs_to :badge
end
