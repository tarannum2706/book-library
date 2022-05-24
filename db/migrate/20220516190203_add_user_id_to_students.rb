class AddUserIdToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :user_id, :integer
    add_index :students, :user_id
  end
end
