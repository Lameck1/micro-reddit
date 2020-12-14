class User < ApplicationRecord
    EMAIL_REGEX = /\A[a-z0-9._&+-]+@[a-z0-9._&+-]+\.[a-z]{2,4}\Z/i.freeze
    PASSWORD_REGEX = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$@!%&*?])[A-Za-z\d#$@!%&*?]{8,30}$/
    validates :first_name, :last_name, presence: true, length: { maximum: 12 }
    validates :email, presence: true,
                    length: { maximum: 20 },
                    format: { with: EMAIL_REGEX },
                    confirmation: true
    validates :password, presence: true,
                        format: { with: PASSWORD_REGEX }

    has_many :posts
    has_many :comments
end
