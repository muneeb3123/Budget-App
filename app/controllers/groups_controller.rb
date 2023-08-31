class GroupsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @user = current_user
    @groups = @user.groups.includes(:trades).all
    @total_amount = Trade.where(group_id: @groups.pluck(:id)).sum(:amount)
  end

  def show
    @user = current_user
    @group = @user.groups.includes(:trades).find(params[:id])
    @amount = @group.trades.sum(:amount)
  end

  def new
    @group = Group.new
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:notice] = 'Successfully deleted'
    redirect_to user_groups_path(current_user)
  end

  def create
    @user = current_user
    @group = @user.groups.new(group_params)
    if @group.save
      redirect_to user_groups_path(current_user)
      flash[:notice] = 'Successfully created Category'
    else
      flash[:notice] = 'Unable to create Category'
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
