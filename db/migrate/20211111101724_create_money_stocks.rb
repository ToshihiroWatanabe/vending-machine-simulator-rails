class CreateMoneyStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :money_stocks do |t|
      t.integer :deposit, null: false
      t.integer :deposit_10, null: false
      t.integer :deposit_50, null: false
      t.integer :deposit_100, null: false
      t.integer :deposit_500, null: false
      t.integer :deposit_1000, null: false
      t.integer :stock_10, null: false
      t.integer :stock_50, null: false
      t.integer :stock_100, null: false
      t.integer :stock_500, null: false
      t.integer :stock_1000, null: false

      t.timestamps
    end
  end
end
