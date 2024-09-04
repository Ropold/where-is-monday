class CatsController < ApplicationController
  before_action :set_cat, only: [:show]

  def index
    @cats = Cat.where(found: false)
    if params[:query].present?
      @sightings = Sighting.where(city: params[:query])
      @cats = Cat.where(city: params[:query])
    else
      @sightings = Sighting.all
      @cats = Cat.where(found: false)
    end
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user = current_user

    if @cat.save
      redirect_to cat_path(@cat)
    else
      render :new
    end
  end

  def show
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :description, :race, :eye_color, :color, :fur, :origin_address, :city)
  end
end
