class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :source, null: false
      t.references :destination, null: false
      t.decimal :amount, null: false

      t.timestamps
    end
  end
end
