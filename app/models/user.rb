class User < ApplicationRecord
  EMAIL_REGEX = /\A[a-z0-9._&+-]+@[a-z0-9._&+-]+\.[a-z]{2,4}\Z/i.freeze
  PASSWORD_REGEX = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x.freeze

  validates :first_name, :last_name, presence: true, length: { maximum: 12 }
  validates :email, presence: true,
                    length: { maximum: 20 },
                    format: { with: EMAIL_REGEX },
                    confirmation: true
  validates :password, presence: true,
                       format: { with: PASSWORD_REGEX }

  has_many :posts, dependent: :destroy
  has_many :comments
end
