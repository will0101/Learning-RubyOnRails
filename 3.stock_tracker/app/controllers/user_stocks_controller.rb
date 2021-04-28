class UserStocksController < ApplicationController

  def create 
    stock = Stock.check_db(params[:ticker])
    if stock.blank?
      stock = Stock.find_by_ticker(params[:ticker])
      stock.save
    end
    @user_stock = UserStock.create(user:current_user, stock:stock)
    flash[:notice] = "Stock #{stock.name} was succesfully added to your portfolio"
    redirect_to my_portfolio_path
  end

end
