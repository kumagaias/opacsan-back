class CreateLibraryUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :library_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :library, null: false, foreign_key: true
      t.integer :role, default: 0
      t.integer :status, default: 0
      t.string :activation_code
      t.datetime :activation_code_expired_at

      t.timestamps
    end
  end
end
