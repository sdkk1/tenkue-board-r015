class Comment < ApplicationRecord
  with_options presence: true do
    validates :comment, length: { maximum: 140 }
  end

  belongs_to :user
  belongs_to :post
end
