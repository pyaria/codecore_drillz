class Drill < ActiveRecord::Base

  has_many :answers

  has_many :drill_records
  has_many :users, through: :drill_records

end
