class CreateSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.string :name
      t.string :description
      t.date :date
      t.string :time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
