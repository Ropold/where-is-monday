class SightingsController < ApplicationController
  def index
    @sightings = Sighting.all
  end

  def show
    @sighting = Sighting.find(params[:id])
  end

  def new
    @sighting = Sighting.new
  end

  def create
    @sighting = Sighting.new(sighting_params)
    if @sighting.save
      redirect_to sightings_path
    else
      render :new
    end
  end

  def edit
    @sighting = Sighting.find(params[:id])
  end

  def update
    @sighting = Sighting.find(params[:id])
    if @sighting.update(sighting_params)
      redirect_to sightings_path
    else
      render :edit
    end
  end

  def destroy
    @sighting = Sighting.find(params[:id])
    @sighting.destroy
    redirect_to sightings_path
  end

  private

  def sighting_params
    params.require(:sighting).permit(:last_seen_at, :latitude, :longitude, :description, :address, :user_id)
  end
end
