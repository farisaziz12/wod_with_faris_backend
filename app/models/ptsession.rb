class Ptsession < ApplicationRecord
  belongs_to :client, :class_name => :User,:foreign_key => "client_id"
  belongs_to :coach, :class_name => :User,:foreign_key => "coach_id"
end
