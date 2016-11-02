class BagsController < ApplicationController
def index
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
    @user = User.find(params[:user_id])
    @bag = Bag.find(params[:id])
    if @bag.update_attributes(bag_params)
      if current_user.is_hunter
        redirect_to bounties_path(@user)
      else
        redirect_to user_bag_path(@user, @bag)
      end
    else
      render 'edit'
    end
  end

  def destroy
    @bag = Bag.find(params[:id])
    @bag.destroy
    redirect_to user_bags_path
  end

  # def hunt
  # @bag = Bag.find(params[:id])
  # @bag.update_attribute(:hunter_id, bag.hunter_id == @current_user.id)
  # redirect_to bounties_path(@current_user)
  # end

  private
    def bag_params
      params.require(:bag).permit(
        :name,
        :comments,
        :estimated_price,
        :hunter_id)
    end
end
