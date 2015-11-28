class CreateBadgings < ActiveRecord::Migration
  def change
    create_table :badgings do |t|

      t.timestamps null: false
    end
  end
end
