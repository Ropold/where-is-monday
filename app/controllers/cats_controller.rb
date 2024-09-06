class CatsController < ApplicationController
  before_action :set_cat, only: [:show]

  def index
    @cats = Cat.where(found: false)
    if params[:query].present?
      @sightings = Sighting.search_by_city(params[:query])
      @cats = Cat.search_by_city(params[:query])
    else
      @sightings = Sighting.all
      @cats = Cat.where(found: false)
    end
    # @markers = @cats.geocoded.map do |cat|
    #   {
    #     lat: cat.origin_latitude,
    #     lng: cat.origin_longitude,
    #     info_window: render_to_string(partial: "info_window", locals: { cat: cat })
    #   }
    # end + @sightings.geocoded.map do |sighting|
    #   {
    #     lat: sighting.latitude,
    #     lng: sighting.longitude,
    #     info_window: render_to_string(partial: "info_window", locals: { sighting: sighting })
    #   }
    # end
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

  def edit
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    @cat.update(cat_params)
    redirect_to cat_path(@cat)
  end

  def destroy
    @cat = Cat.find(params[:id])
    @cat.destroy
    redirect_to my_cats_path
  end

  def my_cats
    @cats = current_user.cats
  end

  def show
    @markers = @cat.sightings.geocoded.map do |sighting|
      {
        lat: sighting.latitude,
        lng: sighting.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { sighting: sighting })
      }
    end

    @markers << {
      lat: @cat.origin_latitude,
      lng: @cat.origin_longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { cat: @cat })
    }
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :description, :race, :eye_color, :color, :fur, :origin_address, :city, :photo)
  end
end
