class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    # @user = User.find(params[:id])
    # @bags = @user.bags
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "You have successfully signed up!"
      redirect_to user_path
    else
      render 'new'
  end
end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :location)
  end
end
