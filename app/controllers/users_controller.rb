class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @bags = @user.bags
  end

  def create
    @user = User.new(user_params)
    if @user.avatar.nil?
      @user.avatar = Faker::Avatar.image
    end
    if @user.save
      session[:user_id] = @user.id
        if @user.is_hunter
          redirect_to bounties_path(@user)
        else
          redirect_to user_path(@user)
        end
    else
      render 'new'
  end
end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
        if @user.is_hunter
          redirect_to bounties_path(@user)
        else
          redirect_to user_path(@user)
        end
    else
      render 'edit'
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :zipcode, :is_hunter)
  end
end
