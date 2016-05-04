class User < ActiveRecord::Base
    validates :user_name,  presence: true, length: { minimum: 2, maximum: 50 }
    validates :user_email, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :user_email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
                    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

end