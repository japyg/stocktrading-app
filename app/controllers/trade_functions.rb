class TradeFunctionsController < ApplicationController
 def new
  @trade_function = TradeFunction.new
 end
 def create
  @trade_function = TradeFunction.new(trade_params)
  @trade_function.user_id = current_user.id
  @trade_function.stock_id = params[:stock_id]
  @trade_function.price = @stock.last_price
  @trade_function.total_price = @stock.last_price * quantity
  @trade_function.transaction_type = params[:transaction_type]
  @trade_function.quantity = params[:quantity]
  @trade_function.save
     if @trade_function.save
       @user.update(balance: current_user.balance - @trade_function.total_price)
       @user.save
        flash[:notice] = "success"
     else
        flash[:error] = "failed"
    end
    redirect_to my_portfolio_path

 end
  private
    def trade_params
        params.require(:trade_function).permit(:user_id, :stock_id, :quantity, :price, :total_price, :transaction_type)
    end
end    