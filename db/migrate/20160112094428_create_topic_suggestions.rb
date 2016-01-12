class CreateTopicSuggestions < ActiveRecord::Migration
  def change
    create_table :topic_suggestions do |t|
      t.string :name, null: false, unique: true
      t.timestamps null: false
    end
  end
end
