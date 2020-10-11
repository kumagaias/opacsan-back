class Book < ApplicationRecord
  has_many :book_checkout_histories
  belongs_to :library
  enum status: { maintenance: 0, available: 1, checkouted: 2 }
  validates :title, presence: true
  validates :library_id, presence: true
end
