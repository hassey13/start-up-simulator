class PersonasController < ApplicationController

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
      @persona = Persona.find_by(name: params[:persona_login][:name])

    else
      ##Attempt Registration
      @persona = Persona.new(persona_params)
        @persona.money = 10000
        @persona.user_id = 1
        @persona.save
    end
    session[:persona_id] = @persona.id
    redirect_to @persona

  end

  def show
    if session[:persona_id].blank?
      redirect_to new_persona_path and return
    end
    @persona = Persona.find(session[:persona_id])
  end

  def destroy
    session[:persona_id] = nil
    redirect_to new_persona_path
  end

  private

  def persona_params
    params.require(:persona).permit(:name)
  end

end
