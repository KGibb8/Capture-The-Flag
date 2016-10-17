class User < ApplicationRecord
  has_many :user_games
  has_many :games, through: :user_games
  has_many :created_games, class_name: "Game", foreign_key: :creator_id, inverse_of: :creator
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader
end
