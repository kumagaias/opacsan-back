class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.date :published_at
      t.string :description
      t.string :isbn10
      t.string :isbn13
      t.integer :status, null: false, default: 0
      t.index :status
      t.references :library, null: false, foreign_key: true
      t.references :checkout_user, foreign_key: { to_table: :users }
      t.references :register_user, foreign_key: { to_table: :users }
      t.references :update_user, foreign_key: { to_table: :users }
      t.integer :lock_version, default:0, null: false

      t.timestamps
    end
  end
end
