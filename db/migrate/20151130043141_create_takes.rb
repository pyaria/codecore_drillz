class CreateTakes < ActiveRecord::Migration
  def change
    create_table :takes do |t|
      t.string :times

      t.timestamps null: false
    end
  end
end
