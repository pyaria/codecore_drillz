class Drill < ActiveRecord::Base

  has_many :answers, dependent: :destroy
  has_many :drill_completes, dependent: :destroy
  has_many :driller_users, through: :drill_completes, source: :user

  belongs_to :drill_group
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :points, numericality: {greater_than_or_equal_to: 0}
end
