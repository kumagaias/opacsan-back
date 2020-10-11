class CreateLibraries < ActiveRecord::Migration[6.0]
  def change
    create_table :libraries do |t|
      t.string :name, uniqueness: true, null: false
      t.references :register_user, foreign_key: { to_table: :users }
      t.integer :lock_version, default:0, null: false

      t.timestamps
    end
  end
end
