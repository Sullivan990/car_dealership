class ManufacturersController < ApplicationController
  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(params.require(:manufacturer)
      .permit(:name, :country))

    if @manufacturer.save
      redirect_to new_manufacturer_path, notice: "Manufacturer successfully added!"
    else
      render :new
    end
  end
end
