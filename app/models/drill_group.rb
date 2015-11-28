class DrillGroup < ActiveRecord::Base
  has_many :drills
  belongs_to :user

  validates :name, presence: true
end
