class CreateQuests < ActiveRecord::Migration[6.0]
  def change
    create_table :quests do |t|
      t.string :title, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
