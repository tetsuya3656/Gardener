class CreateQuestionComments < ActiveRecord::Migration[6.1]
  def change
    create_table :question_comments do |t|
      t.integer :user_id, null: false
      t.integer :question_id, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end
