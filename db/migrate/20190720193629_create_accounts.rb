class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :branch, null: false
      t.string :number, null: false
      t.string :digit, null: false
      t.string :password_digest, null: false
      t.decimal :balance, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
