class AddressesController < ApplicationController
  before_action :trip, :location, :address, only: [:show, :edit, :update, :destroy]
  before_action :trip, :location, only: :create

  def new
    @address = Address.new
  end

  def create
    @address = @location.address.new(address_params)
    if @address.save
      redirect_to trip_location_address_path(@trip, @location, @address)
    else
      render :new
    end
  end

  def show
    @address
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to trip_location_address_path(@trip, @location, @address)
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to trip_location_path
  end

  private
    def address_params
      params.require(:address).permit(:street, :city, :state, :zip,)
    end

    def trip
      @trip = Trip.find(params[:trip_id])
    end

    def location
      @location = @trip.locations.find(params[:location_id])
    end

    def address
      @address = @location.address.find(params[:id])
    end


end
