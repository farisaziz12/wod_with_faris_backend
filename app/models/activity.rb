class Activity < ApplicationRecord
    belongs_to :user
    scope :between, ->(start_date, end_date) { where(date: start_date..end_date) }
end
