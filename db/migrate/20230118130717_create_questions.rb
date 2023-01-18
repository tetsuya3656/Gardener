class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :user_id, null: false
      t.string :image, null: false
      t.text :title, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
