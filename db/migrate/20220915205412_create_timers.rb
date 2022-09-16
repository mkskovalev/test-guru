class CreateTimers < ActiveRecord::Migration[6.1]
  def change
    create_table :timers do |t|
      t.references :test_passage, null: false, foreign_key: true
      t.integer :end_time, null: false
      t.timestamps
    end
  end
end
