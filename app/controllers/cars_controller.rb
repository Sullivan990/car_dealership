class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(params.require(:car)
      .permit(:color, :year, :mileage, :description))

    if @car.save
      redirect_to new_car_path, notice: "Car successfully added!"
    else
      render :new
    end
  end
end
