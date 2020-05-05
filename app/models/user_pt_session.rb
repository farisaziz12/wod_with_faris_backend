class UserPtSession < ApplicationRecord
  belongs_to :user
  belongs_to :ptsession
end
