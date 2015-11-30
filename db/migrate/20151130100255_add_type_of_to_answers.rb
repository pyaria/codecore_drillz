class AddTypeOfToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :type_of, :integer
  end
end
