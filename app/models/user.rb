class User < ApplicationRecord
    has_many :user_sessions, dependent: :destroy
    has_many :sessions, through: :user_sessions, dependent: :destroy 
    has_many :activities
    validates :email, presence: true, uniqueness: true

    def token
        JWT.encode({ user_id: self.id }, ENV['NUTRI'])
    end

end