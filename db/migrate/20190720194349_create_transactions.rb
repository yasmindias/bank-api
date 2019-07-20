class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :source
      t.references :destination
      t.decimal :amount

      t.timestamps
    end
  end
end
