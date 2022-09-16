class AddColumnTimeToTests < ActiveRecord::Migration[6.1]
  def change
    remove_columns :tests, :with_timer
    drop_table :timers
  end
end
