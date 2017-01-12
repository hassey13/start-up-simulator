class GameController < ApplicationController
  before_action :require_login

  def advance_time

    # elapsed_time = params[:time]
    elapsed_time = 30

    @persona = Persona.find(current_persona.id)
    @persona.game_time += elapsed_time
    @persona.save

    # sell units every 30 days
    products = @persona.products

    # find product
    products.each do |product|
      demand = product.demand

      # remove from DC
      dc = ProductDistributionCenter.find_by(product_id: product.id)
      dc.quantity -= demand
      dc.save

      # pay user
      if dc.quantity < 0
        profit = product.sell_price
        @persona.money += (profit * (demand+dc.quantity))

        #reset to 0
        product.demand += (dc.quantity/4)
        dc.quantity = 0
        dc.save
      else
        profit = product.sell_price
        @persona.money += (profit * demand)
      end
      @persona.save
      dc.save

    end

      #change demand random number -20 - 20
      change_in_demand = rand(0...61) - 20
      flash[:notice] = "Your demand changed - #{change_in_demand} units"
      @persona.products.first.demand += change_in_demand
      @persona.products.first.demand = 0 if @persona.products.first.demand < 0
      @persona.products.first.save

    #duplicate call to update info (might be pointless)
    @persona = Persona.find(current_persona.id)
    products = @persona.products.where(active: true)
    products.each do |product|

      # find orders that have elapsed past 60 days and are not yet completed
      product.orders.where(complete: false).each do |order|

        #check to see if complete
        if (order.order_date + 60) <= @persona.game_time

          # complete them
          order.complete = true
          order.save

          # transfer them to DC
          qty = order.quantity
          dc = order.product.product_distribution_centers.first
          dc.quantity += qty
          dc.save
        end
      end
    end

    redirect_to @persona
  end


end
