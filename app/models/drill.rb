class Drill < ActiveRecord::Base
  belongs_to :drill_group
  belongs_to :user
  has_many :answers

  validates :name, presence: true
  validates :description, presence: true
end
