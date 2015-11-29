class Category < ActiveRecord::Base

  has_many :categorizations, dependent: :destroy
  has_many :drill_groups, through: :categorizations
end
