class UserDrillGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :drill_group

  validates :drill_group_id, uniqueness: {scope: :user_id}

  #def contains?()
end
