class Drill < ActiveRecord::Base

  has_many :answers
  has_many :drill_completes
  has_many :driller_users, through: :drill_completes, source: :user

  belongs_to :drill_group
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
end
