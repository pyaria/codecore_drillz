class AddDrillReferencesToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :drill, index: true, foreign_key: true
  end
end
