class AddStockQuantityToStocks < ActiveRecord::Migration[6.1]
  def change
    add_column :stocks, :stock_quantity, :integer
  end
end
