class FactoriesController < ApplicationController

  def new

  end

  def create
    @persona = Persona.find(current_persona.id)
    @factory = Factory.find(params[:factory])
    @factory.availability = true
    @factory.save
    @persona.money -= @factory.cost
    @persona.save
    redirect_to @persona
  end

  def show
    @factory = Factory.find(params[:id])
  end
end
