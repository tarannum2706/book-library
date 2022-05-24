class AddBookToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :book, :string
  end
end
