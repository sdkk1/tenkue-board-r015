class Comment < ApplicationRecord
  with_options presence: true do
    validates :comment, length: { maximum: 140 }
    validates :user_id, :post_id
  end

  belongs_to :user
  belongs_to :post
end
