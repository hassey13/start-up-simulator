class SessionsController < ApplicationController

  def new
    redirect_to new_user_path
  end

  def create
    @user = User.find_by(user_name: params[:user_name])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/personas'
    else
      flash[:notice] = "Login Failed"
      redirect_to sign_up_path
    end
  end

  def destroy
    session[:user_id] = nil
    session[:persona_id] = nil
    redirect_to new_user_path
  end

end
