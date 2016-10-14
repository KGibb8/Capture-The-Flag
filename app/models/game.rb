require './app/uploaders/picture_uploader'

class Game < ApplicationRecord
  has_many :sessions
  has_many :users, through: :sessions
  # belongs_to :creator, class_name: "User"
  
  mount_uploaders :pictures, PictureUploader
end
