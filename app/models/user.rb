class User < ApplicationRecord
    has_many :user_sessions, dependent: :destroy
    has_many :sessions, through: :user_sessions, dependent: :destroy 
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }


    def token
        JWT.encode({ user_id: self.id }, ENV['NUTRI'])
    end

end