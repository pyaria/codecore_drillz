class AddUserToDrill < ActiveRecord::Migration
  def change
    add_reference :drills, :user, index: true, foreign_key: true
  end
end
