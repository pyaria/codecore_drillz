class Badge < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :badgings, dependent: :destroy
  has_many :drill_groups, through: :badgings

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges
end
