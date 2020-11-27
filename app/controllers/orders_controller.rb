class OrdersController < ApplicationController
  def new
    @spaceship = Spaceship.find(params[:spaceship])  
    @order = Order.new
  end
  def create
    @order = Order.new()
    @spaceship = Spaceship.find(params[:spaceship])
    @order.start_date= params[:start_date]
    @order.end_date = params[:end_date]
    @order.spaceship = @spaceship
    @order.user = current_user
    if @order.save
      redirect_to user_path(current_user), notice: "Reservé. Merci de votre confiance."
    else
      render :new
    end
  end

  # def order_params
  #   params.require(:order).permit(:start_date, :end_date)
  # end
end
