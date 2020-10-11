class BookCheckoutHistory < ApplicationRecord
  belongs_to :book
  belongs_to :checkout_user, class_name: :User, optional: true
end
