class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true

  def self.find_by_ticker(ticker_symbol) 
    api_key = self.get_api_key()
    client = IEX::Api::Client.new(
      publishable_token: self.get_api_key(),
      secret_token: self.get_secret_key(),
      endpoint: self.get_endpoint()
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

  # This could be one method but for practice sake I will keep it splite up
  private 
  def self.get_api_key
    return Rails.application.credentials.iex_client[:sandbox_api_key] unless  Rails.env.production?
    ENV["IEX_PUBLISHABLE_API_KEY"]
  end

  def self.get_secret_key
    return Rails.application.credentials.iex_client[:sandbox_secret_key] unless Rails.env.production?
    ENV["IEX_SECRET_KEY"]
  end 

  def self.get_endpoint 
    return 'https://sandbox.iexapis.com/v1'  unless Rails.env.production?
    "https://cloud.iexapis.com/v1"
  end

end
