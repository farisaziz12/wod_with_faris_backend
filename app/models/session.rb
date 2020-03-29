class Session < ApplicationRecord
  belongs_to :coach, :class_name => 'User', :foreign_key => 'user_id'
  has_many :user_sessions, dependent: :destroy
  has_many :users, through: :user_sessions, dependent: :destroy

  scope :between, ->(start_date, end_date) { where(date: start_date..end_date) }

end
