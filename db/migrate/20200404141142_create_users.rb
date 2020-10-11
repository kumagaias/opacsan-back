class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, uniqueness: true, null: false
      t.string :name, null: false
      t.string :password_digest
      t.references :register_user, foreign_key: { to_table: :users }
      t.references :update_user, foreign_key: { to_table: :users }
      t.integer :lock_version, default:0, null: false

      t.timestamps
    end
  end
end
