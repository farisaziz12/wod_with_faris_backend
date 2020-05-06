class Ptsession < ApplicationRecord
  belongs_to :coach, :class_name => 'User', :foreign_key => 'user_id'
  has_many :user_pt_sessions, dependent: :destroy
end
