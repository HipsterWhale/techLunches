class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :title, null: false, limit: 128
      t.string :subtitle, null: false, limit: 256
      t.string :speaker, null: false
      t.datetime :event_date, null: false
      t.integer :sits, null: false
      t.text :description, null: false
      t.timestamps null: false
    end
  end
end
