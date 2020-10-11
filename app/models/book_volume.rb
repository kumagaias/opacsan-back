class BookVolume < ApplicationRecord
  belongs_to :book
  belongs_to :checkout_user, class_name: :User, optional: true
  belongs_to :register_user, class_name: :User
  belongs_to :update_user, class_name: :User, optional: true
  has_many :book_volume_histories
  enum status: { maintenance: 0, available: 1, checkouted: 2 }

  scope :library_id, -> id {
    joins(:book).where('books.library_id = ?', id)
  }

  class << self
    def by_library_id(id)
      library_id(id)
    end
  end
end
