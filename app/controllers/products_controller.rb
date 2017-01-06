class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.persona_id = session[:persona_id]
    @product.save
    redirect_to "/personas/#{session[:persona_id]}"
  end



  private

  def product_params
    params.require(:product).permit(:name, :category, :sell_price)
  end
end
