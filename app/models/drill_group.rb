class DrillGroup < ActiveRecord::Base
  has_many :drills, dependent: :destroy
  belongs_to :user

  has_many :badgings, dependent: :destroy
  has_many :badges, through: :badgings

  has_many :user_drill_groups, dependent: :destroy
  has_many :users, through: :user_drill_groups


  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  validates :name, presence: true
end
