class AddAnswerReferencesToDrill < ActiveRecord::Migration
  def change
    add_reference :drills, :answer, index: true, foreign_key: true
  end
end
