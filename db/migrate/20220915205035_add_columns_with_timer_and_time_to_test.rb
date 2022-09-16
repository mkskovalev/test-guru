class AddColumnsWithTimerAndTimeToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :with_timer, :boolean, default: false
    add_column :tests, :time, :integer
  end
end
