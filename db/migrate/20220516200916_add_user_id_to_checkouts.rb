class AddUserIdToCheckouts < ActiveRecord::Migration[7.0]
  def change
    add_column :checkouts, :user_id, :integer
    add_index :checkouts, :user_id
  end
end
