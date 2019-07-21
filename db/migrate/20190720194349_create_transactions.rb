class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :account, foreign_key: true, null: false
      t.string :type, null: false
      t.decimal :amount, null: false

      t.timestamps
    end
  end
end
