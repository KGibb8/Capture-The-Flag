class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name
      t.datetime :start_time
      t.json :picture
      t.float :lat
      t.float :long
      t.text :description
      t.references :creator, foreign_key: true

      t.timestamps
    end
  end
end
