class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.references :plan, foreign_key: true
      t.references :food, foreign_key: true
      t.integer :quantity
      t.boolean :default, default: false
      t.boolean :hidden, default: false

      t.timestamps
    end
  end
end
