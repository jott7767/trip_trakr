class TripsController < ApplicationController
  before_action :trip, except: [:index, :new, :create]

  def index
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    if @person.save
      redirect_to trips_path(@trip)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to trip_path
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end





  private
    def trip_params
      params.require(:trip).permit(:name, :start_date, :end_date)
    end

    def trip
      @trip = Trip.find(params[:id])
    end
end
