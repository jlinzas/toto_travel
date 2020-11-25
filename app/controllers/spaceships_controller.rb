class SpaceshipsController < ApplicationController
  def index
    @spaceships = Spaceship.all
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
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:name, :number_of_seats, :speed, :price, :description, :photo)
  end

end
