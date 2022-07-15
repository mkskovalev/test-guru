class RemoveAuthorFromTests < ActiveRecord::Migration[6.1]
  def change
    remove_column :tests, :author, :integer
    remove_column :tests, :author_id, :integer
  end
end
