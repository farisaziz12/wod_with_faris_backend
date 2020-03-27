class Session < ApplicationRecord
  belongs_to :coach
  has_many :user_sessions, dependent: :destroy
  has_many :users, through: :user_sessions, dependent: :destroy 
end
