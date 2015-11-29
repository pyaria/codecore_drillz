class DrillComplete < ActiveRecord::Base
  belongs_to :user
  belongs_to :drill

  attr_accessor :new_answer
end
