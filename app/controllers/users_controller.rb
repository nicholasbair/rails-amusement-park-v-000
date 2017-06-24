class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to @user
    end
  end

  def show
    if !logged_in?
      redirect_to root_path
    end
    @user = User.find_by(:id => params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :nausea, :tickets, :height, :admin)
    end
end
