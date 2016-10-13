class AddPicturesToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :pictures, :json
  end
end
