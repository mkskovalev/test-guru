class AddReferences < ActiveRecord::Migration[6.1]
  def change
    add_reference :tests, :category, null: false, foreign_key: true
    add_reference :questions, :test, null: false, foreign_key: true
    add_reference :answers, :question, null: false, foreign_key: true
    add_reference :tests, :author, null: false, foreign_key: { to_table: :users }
  end
end
