class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user && @user.valid?
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:notice] = "Could not create new user"
      redirect_to new_user_path
    end

  end

  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    flash[:notice] = "User has been deleted"
    redirect_to new_user_path
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password, :first_name, :last_name, :email)
  end
end
