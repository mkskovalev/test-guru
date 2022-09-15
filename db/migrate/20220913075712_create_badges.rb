class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image, null: false
      t.integer :rule, null: false
      t.string :sub_rule
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
