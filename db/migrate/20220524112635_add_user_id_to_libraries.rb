class AddUserIdToLibraries < ActiveRecord::Migration[7.0]
  def change
    def change
      add_column :libraries, :user_id, :integer
      add_index :libraries, :user_id
    end
  end
end
