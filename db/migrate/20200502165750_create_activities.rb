class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.date :date
      t.string :activity_type
      t.string :workout
      t.integer :duration
      t.integer :calories_burned
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
