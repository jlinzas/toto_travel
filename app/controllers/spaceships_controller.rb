class SpaceshipsController < ApplicationController

  def index

    if params[:query].present?

      if params[:query][:name].present?
        @spaceships = Spaceship.search_by_title(params[:query][:name])
      else
        @spaceships = Spaceship.all
      end

      if params[:query][:price].present?
        @price_category = params[:query][:price]
      else
        @spaceships
      end

      if @price_category == "€"
        @spaceships = @spaceships.where(price:0..1000)
      elsif @price_category == "€€"
        @spaceships = @spaceships.where(price:1000..10000)
      elsif @price_category == "€€€"
        @spaceships = @spaceships.where(price:10000..1000000)
      end

    else
     @spaceships = Spaceship.all
  end
end

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user
    if @spaceship.save
      redirect_to spaceships_path
    else
      render :new
    end
  end

  def show
    @spaceship = Spaceship.find(params[:id])
  end

  def edit
    @spaceship = Spaceship.find(params[:id])
    @spaceships = Spaceship.all
  end

  def map
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :number_of_seats, :speed, :price, :description, :photo)
  end



end
