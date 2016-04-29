class User < ActiveRecord::Base
  validates :user_name,  presence: true, length: { maximum: 50 }
  validates :user_email, presence: true, length: { maximum: 255 },
                    uniqueness: { case_sensitive: false }
  
    
end