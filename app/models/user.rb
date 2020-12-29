class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name, :password_confirmation
    validates :email, format: { with: /\A[\x01-\x7E][a-z_0-9+\-.]+@[a-z0-9\-.]+\.[a-z]+\z/i }, uniqueness: { case_sensitive: true }
    validates :password, format: { with: /\A(?=.*[0-9])(?=.*[a-zA-Z])([a-zA-z0-9]{8,32})\z/ }, confirmation: true
  end

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
