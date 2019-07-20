class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :branch
      t.string :number
      t.string :digit
      t.decimal :balance
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
