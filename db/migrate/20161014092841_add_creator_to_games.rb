class AddCreatorToGames < ActiveRecord::Migration[5.0]
  def change
    add_reference :games, :creator
  end
end
