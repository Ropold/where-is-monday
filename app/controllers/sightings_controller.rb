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
    @sighting.user = current_user
    if @sighting.save && @sighting.cat.present?
      redirect_to cat_path(@sighting.cat)
    elsif @sighting.save
      redirect_to sightings_path, notice: 'Sighting was successfully created.'
    else
      render :new, status: :unprocessable_entity
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
    @cat = Cat.find(params[:id])
    redirect_to cat_path(@cat)
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
      redirect_to sightings_path, notice: 'Sighting was successfully created.'
    else
      render :new
    end
  end

  def accept
    @sighting.update
  end

  private

  def sighting_params
    params.require(:sighting).permit(:last_seen_at, :latitude, :longitude, :description, :city, :address, :user_id, :cat_id, :photo)
  end
end
