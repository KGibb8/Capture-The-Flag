class CreateUserGames < ActiveRecord::Migration[5.0]
  def change
    create_table :user_games do |t|
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true
      t.boolean :is_present, default: false
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
