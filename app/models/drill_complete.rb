class DrillComplete < ActiveRecord::Base
  belongs_to :user
  belongs_to :drill

  validates :drill_id, uniqueness: {scope: :user_id}

  attr_accessor :new_answer
end
