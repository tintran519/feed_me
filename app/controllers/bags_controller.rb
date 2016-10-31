class BagsController < ApplicationController
def index
    # @bags = Bag.all
    @user = User.find(params[:user_id])
    @bags = @user.bags
  end

  def show
    @bag = Bag.find(params[:id])
    @user = @bag.user
  end

  def new
    @user = User.find(params[:user_id])
    @bag = @user.bags.new
  end

  def create
    @user = User.find(params[:user_id])
    @bag = @user.bags.new(bag_params)
    if @bag.save
      redirect_to user_bags_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @bag = Bag.find(params[:id])
  end

  def update
    @bag = Bag.find(params[:id])
    if @bag.update_attributes(bag_params)
      redirect_to bag_path
    else
      render 'edit'
    end
  end

  def destroy
    @bag = Bag.find(params[:id])
    @bag.destroy
    redirect_to bag_path
  end

  private
    def bag_params
      params.require(:bag).permit(
        :name,
        :comments,
        :estimated_price)
    end
end
