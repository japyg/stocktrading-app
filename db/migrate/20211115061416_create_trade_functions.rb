class CreateTradeFunctions < ActiveRecord::Migration[6.1]
  def change
    create_table :trade_functions do |t|
      t.string :user_id
      t.integer :stock_id
      t.decimal :price
      t.integer :quantity
      t.string :transaction_type
      t.float :total_price

      t.timestamps
    end
  end
end
