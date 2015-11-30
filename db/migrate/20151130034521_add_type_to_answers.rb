class AddTypeToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :type, :integer
  end
end
