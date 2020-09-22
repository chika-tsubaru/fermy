class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :plan
      t.text :text
      t.integer :user_id
      t.integer :quest_id
      t.timestamps
    end
  end
end
