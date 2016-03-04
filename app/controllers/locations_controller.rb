class LocationsController < ApplicationController
  before_action :trip, :location, only: [:show, :edit, :update]
  before_action :trip, only: :index

  def index
    @locations = @trip.locations.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = @trip.location.new(location_params)
    if location.save
      redirect_to trip_locations_path(@trip)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to trip_location_path(@trip, @location)
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to trip_locations_path(@trip)
  end


private
  def location_params
    params.require(:location).premit(:name)
  end

  def location
    @trip.locations.find(params[:id])
  end

  def trip
    @trip = Trip.find(params[:trip_id])
  end



end
