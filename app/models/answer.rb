class Answer < ActiveRecord::Base
  belongs_to :drill
  belongs_to :user

  validates :description, presence: true
  validates :type_of, presence: true
end
