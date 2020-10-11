class BookCheckoutHistorySerializer < ActiveModel::Serializer
  attributes :id,
    :book_id,
    :checkout_user_id,
    :created_at
end
