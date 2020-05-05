class CreateUserPtSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_pt_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :ptsession, null: false, foreign_key: true

      t.timestamps
    end
  end
end
