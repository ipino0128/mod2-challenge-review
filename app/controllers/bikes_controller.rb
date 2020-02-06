class BikesController < ApplicationController
  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    if @bike.save
      flash[:message] = "Bike created succesfully"
      redirect_to bike_path(@bike) 
    else 
      # byebug
      flash.now[:message] = @bike.errors.full_messages[0]
      render :new
    end
  end

  private

  def bike_params 
    params.require(:bike).permit(:color, :model, :user_id)
  end 
end
