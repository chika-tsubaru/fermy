class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :plan, null: false
      t.text :text, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.integer :quest_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
