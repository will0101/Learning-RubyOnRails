class StocksController < ApplicationController

  def search
    if params[:stock].present? 
      @stock = Stock.find_by_ticker(params[:stock])
      if @stock 
        respond_to do |format|
          format.js {render partial: "users/result"}
        end
      else 
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid symbol to search"
          format.js {render partial: "users/result"}
        end 
        redirect_to my_portfolio_path
      end
    else 
      flash.now[:alert] = "Please enter a symbol to search"
      redirect_to my_portfolio_path
    end 
  end
end

