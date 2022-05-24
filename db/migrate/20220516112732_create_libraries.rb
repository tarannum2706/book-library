class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :email_id
      t.string :library
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
