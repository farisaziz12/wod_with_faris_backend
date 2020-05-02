class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.date :date
      t.string :type
      t.string :workout
      t.string :duration
      t.string :calories_burned

      t.timestamps
    end
  end
end
