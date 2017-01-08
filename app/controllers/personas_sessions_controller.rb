class PersonasSessionsController < ApplicationController
  before_action :require_login

  def new
    redirect_to new_persona_path
  end

  def create

    @persona = current_user.personas.find {|p| p.name == (params[:persona][:name])}

    if @persona
      session[:persona_id] = @persona.id
      redirect_to @persona
    else
      flash[:notice] = "Please select a persona."
      redirect_to new_persona_path
    end
  end

  def destroy
    session[:persona_id] = nil
    redirect_to new_persona_path
  end

end
