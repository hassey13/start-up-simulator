class DistributionCentersController < ApplicationController
  before_action :require_login

  def new
    @distribution_center = DistributionCenter.new
  end

  def create
    @distribution_center = DistributionCenter.new(dc_params)
    @distribution_center.persona_id = current_persona.id
    @distribution_center.capacity = 100000
    @distribution_center.save
    redirect_to current_persona
  end

  def stock_product
    @dc = DistributionCenter.find(params[:id])
    @pdc = ProductDistributionCenter.new
    @pdc.distribution_center_id = @dc.id
    @pdc.product_id = Product.find_by(name: params[:product][:name]).id
    @pdc.quantity = 0
    @pdc.save
    redirect_to @dc
  end

  def show
    @distribution_center = DistributionCenter.find(params[:id])
  end

  private

  def dc_params
    params.require(:distribution_center).permit(:name)
  end
end
