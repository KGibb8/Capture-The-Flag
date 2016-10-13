class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.boolean :is_attending
      t.boolean :is_present
      t.float :lat
      t.float :long

      t.timestamps
    end
  end
end
