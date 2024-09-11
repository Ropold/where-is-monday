class CatsController < ApplicationController
  before_action :set_cat, only: [:show]

  def index
    @cats = Cat.where(found: false)
    @sightings = Sighting.geocoded.where(cat_id: nil)
    if params[:query].present?
      @sightings = @sightings.search_by_address(params[:query]).sort_by { |sighting| sighting.last_seen_at }.reverse
      @cats = Cat.search_by_address(params[:query])
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
      render :new, status: :unprocessable_entity

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

  def found
    @cat = Cat.find(params[:id])
    @cat.update(found: true)
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
    sorted_sightings = @cat.sightings.geocoded.where(status: 'accepted').order(last_seen_at: :asc)
    @markers = sorted_sightings.map.with_index do |sighting, index|
      {
        lat: sighting.latitude,
        lng: sighting.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { sighting: sighting }),
        timestamp: sighting.last_seen_at.to_i,
        is_last: index == sorted_sightings.size - 1
      }
    end

    @markers << {
      lat: @cat.origin_latitude,
      lng: @cat.origin_longitude,
      info_window_html: render_to_string(partial: "info_window", locals: { cat: @cat }),
      timestamp: @cat.created_at.to_i,
      is_first: true,
      is_last: false
    }
  end

  # def show
  #   @markers = @cat.sightings.geocoded.map do |sighting|
  #     {
  #       lat: sighting.latitude,
  #       lng: sighting.longitude,
  #       info_window_html: render_to_string(partial: "info_window", locals: { sighting: sighting }),
  #       timestamp: sighting.last_seen_at.to_i,
  #       is_first: index == 0,
  #       is_last: index == @cat.sightings.count - 1
  #     }
  #   end

  #   @markers << {
  #     lat: @cat.origin_latitude,
  #     lng: @cat.origin_longitude,
  #     info_window_html: render_to_string(partial: "info_window", locals: { cat: @cat }),
  #     timestamp: @cat.created_at.to_i,
  #     is_first: true,
  #     is_last: false
  #   }
  # end


  def nearby
    @cats = Cat.where(found: false).near([params[:latitude].to_f, params[:longitude].to_f], 10)
    render json: @cats.map { |cat|
      cat.as_json.merge({ photo_url: cat.photo.url })
    }
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :description, :race, :eye_color, :color, :fur, :origin_address, :city, :photo, :found)
  end
end
