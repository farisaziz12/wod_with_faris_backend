class CreatePtsessions < ActiveRecord::Migration[6.0]
  def change
    create_table :ptsessions do |t|
      t.string :name
      t.date :date
      t.time :time
      t.string :description
      t.boolean :paid
      t.string :location
      t.references :client_id, null: false, foreign_key: true
      t.references :coach_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
