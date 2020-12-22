class Post < ApplicationRecord
  with_options precedence: true do
    validates :content, length: { maximum: 140 }
    validates :user_id
  end

  belongs_to :user
  has_many :comments, dependent: :destroy
end
