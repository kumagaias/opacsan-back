class BookSerializer < ActiveModel::Serializer
  has_many :book_checkout_histories
  attributes :id,
    :title,
    :author,
    :publisher,
    :published_at,
    :description,
    :isbn10,
    :isbn13,
    :status,
    :library_id,
    :checkout_user_id,
    :register_user_id,
    :update_user_id,
    :lock_version
end
