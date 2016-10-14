class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.float :lat
      t.float :lng
      t.text :description

      t.timestamps
    end
  end
end
