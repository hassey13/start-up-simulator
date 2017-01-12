class OrdersController < ApplicationController

  def create

    @order = Order.new
    @order.product_id = current_persona.products.where(name: params[:order][:name]).first.id
    @order.quantity = params[:order][:quantity]
    @order.factory_id = current_persona.factories.where(name: params[:order][:factory]).first.id
    @order.order_date = current_persona.game_time
    @order.save

    flash[:notice] = "Order was placed successfully!"

    redirect_to current_persona

  end

end
