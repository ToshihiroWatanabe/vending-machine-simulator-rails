class CreateSalesHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :sales_histories do |t|
      t.timestamp :purchase_time, null: false
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
