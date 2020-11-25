class OrdersController < ApplicationController
  def new
    @spaceship = Spaceship.find(params[:spaceship])  
    @order = Order.new
  end
  def create
    @order = Order.new()
    @spaceship = Spaceship.find(params[:spaceship])
    @order.spaceship = @spaceship
    @order.user = current_user
    if @order.save
      redirect_to user_path(current_user), notice: "Reserved"
    else
      render :new
    end
  end

end
