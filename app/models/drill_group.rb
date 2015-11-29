class DrillGroup < ActiveRecord::Base
  has_many :drills
  belongs_to :user

  has_many :badgings, dependent: :destroy
  has_many :badges, through: :badgings

  validates :name, presence: true
end
