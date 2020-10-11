class Library < ApplicationRecord
  has_many :library_users
  has_many :users, through: :library_users
  belongs_to :register_user, class_name: :User, optional: true
end
