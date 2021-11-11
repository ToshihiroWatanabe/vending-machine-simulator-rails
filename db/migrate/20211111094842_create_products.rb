class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.references :temperature, null: false, foreign_key: true
      t.integer :price
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
