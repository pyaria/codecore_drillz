class DrillGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :badgings
end
