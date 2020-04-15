class AddWorkoutToSessions < ActiveRecord::Migration[6.0]
  def change
    add_column :sessions, :workout, :string
  end
end
