class CreateTemperatures < ActiveRecord::Migration[6.1]
  def change
    create_table :temperatures do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
