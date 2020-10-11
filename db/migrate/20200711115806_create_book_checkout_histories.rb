class CreateBookCheckoutHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :book_checkout_histories do |t|

      t.references :book, null: false, foreign_key: true
      t.references :checkout_user, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
