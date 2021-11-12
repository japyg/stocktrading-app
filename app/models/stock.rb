class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :company_name, :stock_symbol, presence: true

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: 'Tpk_453494926640457b83781b79d24e90f9',
      endpoint: 'https://sandbox.iexapis.com/v1'
    )                                  
    begin
      new(stock_symbol: ticker_symbol, company_name: client.company(ticker_symbol), current_price: client.price(ticker_symbol))
    rescue => exception
      return nil
    end
  end

  def self.check_db(ticker_symbol)
    where(stock_symbol: ticker_symbol).first
  end
end