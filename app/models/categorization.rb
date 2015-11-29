class Categorization < ActiveRecord::Base
  belongs_to :drill_group
  belongs_to :category
end
