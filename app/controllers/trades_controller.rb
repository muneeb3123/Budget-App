class TradesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  
    def new
      @group = Group.find(params[:group_id])
      @trade = Trade.new
    end
  
    def create
        @group = Group.find(params[:group_id])
        @trade = @group.trades.new(trade_params)
        @trade.user_id = current_user.id
      
        if @trade.save
          flash[:notice] = "Transaction created successfully."
          redirect_to user_group_path(current_user, @group)
        else
          flash[:alert] = "Transaction not created. Please check the input fields."
          render :new
        end
      end

      def destroy
        @group = Group.find(params[:group_id])
        @trade = Trade.find(params[:id])
        @trade.destroy
        flash[:notice] = "Successfully deleted"
        redirect_to user_group_trades_path(current_user, @group)
      end
      
  
    private
  
    def trade_params
      params.require(:trade).permit(:name, :amount)
    end
  end
  