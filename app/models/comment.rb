class Comment < ApplicationRecord
  validates :body, presence: true, length: { maximum: 100 }
  validates :user_id, :post_id, presence: true
  belongs_to :user
  belongs_to :post
end
