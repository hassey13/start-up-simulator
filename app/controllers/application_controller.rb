class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :current_persona


  def current_user
    User.find(session[:user_id]) if logged_in?
  end

  def current_persona
    Persona.find(session[:persona_id]) if session[:persona_id]
  end

  private

  def logged_in?
    !session[:user_id].blank?
  end

  def require_login
    redirect_to new_user_path unless logged_in?
  end
end
