class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true

  def self.find_by_ticker(ticker_symbol) 
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    begin
      company_name = client.company(ticker_symbol).company_name
      last_price = client.price(ticker_symbol)
      return new(ticker:ticker_symbol,name:company_name,last_price:last_price)
    rescue => exception
      return nil
    end
  end 

  def self.check_db(ticker_symbol)
     where(ticker:ticker_symbol).first
  end

end
