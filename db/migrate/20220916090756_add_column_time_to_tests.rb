class AddColumnTimeToTests < ActiveRecord::Migration[6.1]
  def up
    remove_columns :tests, :with_timer
    drop_table :timers
  end

  def down
    create_table :timers do |t|
      t.references :test_passage, null: false, foreign_key: true
      t.integer :end_time, null: false
      t.timestamps
    end
    add_column :tests, :with_timer, :boolean, default: false
  end
end
