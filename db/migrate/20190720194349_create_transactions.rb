class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :transaction_id, null: false
      t.string :transaction_type, null: false
      t.decimal :amount, null: false
      t.references :account, foreign_key: true, null: false

      t.timestamps
    end
  end
end
