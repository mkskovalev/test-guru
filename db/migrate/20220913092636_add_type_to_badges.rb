class AddTypeToBadges < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :rule, :integer
    add_column :badges, :sub_rule, :string
  end
end
