class SightingsController < ApplicationController
  def index
    @sightings = Sighting.all
  end

  def show
    @sighting = Sighting.find(params[:id])
  end

  def new
    @sighting = Sighting.new
    @cat = Cat.find(params[:cat_id]) if params[:cat_id].present?
  end

  def create
    @sighting = Sighting.new(sighting_params)
    @sighting.user = current_user
    if @sighting.cat.present?
      redirect_to cat_path(@sighting.cat)
    elsif @sighting.save
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

  def step1
    if params[:query].present?
      @cats = Cat.search_by_city(params[:query])
    else
      @cats = Cat.where(found: false)
    end
  end

  def add_sighting
    @cat = Cat.find(params[:cat_id])
    @sighting = Sighting.new
    @sighting.user = current_user
    if @sighting.save
      redirect_to sightings_path
    else
      render :new
    end
  end

  private

  def sighting_params
    params.require(:sighting).permit(:last_seen_at, :latitude, :longitude, :description, :city, :address, :user_id, :cat_id,:photo)
  end
end
