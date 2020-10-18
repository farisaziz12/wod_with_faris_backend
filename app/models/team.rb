class Team < ApplicationRecord
  has_many :users, through: :athlete_team, dependent: :destroy
end
