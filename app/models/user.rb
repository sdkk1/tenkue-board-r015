class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name, :password_confirmation
    validates :email, format: { with: /\A[\x01-\x7E]+\z/ }
  end
end
