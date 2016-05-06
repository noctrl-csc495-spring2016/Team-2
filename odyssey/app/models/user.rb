class User < ActiveRecord::Base
    validates :user_name,  presence: true, length: { minimum: 2, maximum: 50 }
    validates :user_email, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :user_email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: { case_sensitive: false }
                    
    validates :permission_level, :numericality => {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 2}
                    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

end