class PersonasController < ApplicationController
  before_action :require_login

  def index
    @personas = current_user.personas
  end

  def new
    @persona = Persona.new
  end

  def create
    #Logged in check
    unless session[:persona_id].blank?
      @persona = Persona.find(session[:persona_id])
      redirect_to @persona and return
    end

    if !!params[:persona_login]
      ##Attempt login
      @persona = current_user.personas.find {|p| p.name = params[:persona_login][:name] }

    else
      ##Attempt Registration
      @persona = Persona.new(persona_params)
        @persona.money = 20000
        @persona.user_id = current_user.id
        @persona.save
      Factory.add_default_factories(@persona.id)
    end
    session[:persona_id] = @persona.id
    redirect_to @persona

  end

  def show
    if session[:persona_id].blank?
      redirect_to new_persona_path and return
    end
    @persona = current_persona
  end

  def destroy
    current_persona.destroy
    session[:persona_id] = nil
    redirect_to personas_path
  end

  private

  def persona_params
    params.require(:persona).permit(:name)
  end

end
