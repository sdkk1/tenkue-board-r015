class Post < ApplicationRecord
  with_options presence: true do
    validates :content, length: { maximum: 140 }
  end

  belongs_to :user
  has_many :comments, dependent: :destroy
end
