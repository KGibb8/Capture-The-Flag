require './app/uploaders/picture_uploader'

class Game < ApplicationRecord
  has_many :sessions
  has_many :users, through: :sessions
  belongs_to :creator, class_name: "User", inverse_of: :created_games
  
  mount_uploaders :pictures, PictureUploader
end
