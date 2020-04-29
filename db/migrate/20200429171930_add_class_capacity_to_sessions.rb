class AddClassCapacityToSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :class_capacity, :integer
  end
end
