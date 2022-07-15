class ChangeReferenceTestsAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :tests, :author, :integer
    remove_column :tests, :author_id, :integer
    add_column :tests, :author, :integer, references: :admins
  end
end
