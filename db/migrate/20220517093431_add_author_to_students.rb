class AddAuthorToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :author, :string
  end
end
