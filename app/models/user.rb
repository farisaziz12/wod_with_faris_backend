class User < ApplicationRecord
    has_many :user_sessions, dependent: :destroy
    has_many :sessions, through: :user_sessions, dependent: :destroy 
    has_many :teams, through: :athlete_team, dependent: :destroy
    has_many :activities
    has_many :ptsessions
    validates :email, presence: true, uniqueness: true


end