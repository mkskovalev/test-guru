class AddIndexes < ActiveRecord::Migration[6.1]
  def change
    add_index :tests, [:title, :level], unique: true
    add_index :questions, [:body, :test_id], unique: true
    add_index :answers, [:body, :question_id], unique: true
    add_index :categories, :title, unique: true
    add_index :users, :email, unique: true
  end
end
