class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :user_id, null: false
      t.integer :conference_id, null: false
      t.string :feedback
      t.timestamps null: false
    end
  end
end
