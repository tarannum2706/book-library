class Student < ApplicationRecord
  validates :name, :email, presence: true
  validates :author, uniqueness: true
    validates :book, uniqueness: true
  # belongs_to :user
end
