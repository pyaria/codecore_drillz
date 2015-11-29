class Category < ActiveRecord::Base

  has_many :categorizations, dependent: :nullify
  has_many :drill_groups, through: :categorizations

end
