class Post < ApplicationRecord
  validates :title, length: {maximum: 50}, presence: true, uniqueness: true
  validates :body, :user_id, presence: true
  belongs_to :user
  has_many :comments
end
