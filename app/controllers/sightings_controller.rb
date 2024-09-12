class SightingsController < ApplicationController
  before_action :set_sighting, only: [:show, :edit, :update, :destroy, :accept, :reject]
  before_action :set_cat, only: [:new]

  def new
    @sighting = Sighting.new
  end

  def create
    @sighting = Sighting.new(sighting_params)
    @sighting.user = current_user

    if params[:cat_id].present?
      @cat = Cat.find(params[:cat_id])
      @sighting.cat = @cat
      if @cat.user == current_user
        @sighting.status = 'accepted'
      else
        @sighting.status = 'pending'
      end
      # we save with cat_id
      if @sighting.save
        redirect_to cat_path(@cat), notice: 'Sighting was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    else

      # we save with no cat_id
      if @sighting.save
        redirect_to sightings_step1_path, notice: 'Sighting was successfully created. Thanks for helping!'
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    @sighting = Sighting.find(params[:id])
  end

  def update
    @sighting = Sighting.find(params[:id])
    if @sighting.update(sighting_params)
      redirect_to cat_path(@sighting.cat), notice: 'Sighting was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sighting = Sighting.find(params[:id])
    @sighting.destroy
    redirect_to cat_path(@sighting.cat), notice: 'Sighting was successfully destroyed.'
  end

  def accept
    @sighting = Sighting.find(params[:id])
    @sighting.update(status: 'accepted')
    redirect_to @sighting.cat, notice: 'Sighting was successfully accepted.'
  end

  def reject
    @sighting = Sighting.find(params[:id])
    @sighting.update(status: 'rejected')
    redirect_to @sighting.cat, notice: 'Sighting was successfully rejected.'
  end

  def add_sighting
    @sighting = Sighting.new
  end

  def step1
    if params[:query].present?
      @cats = Cat.search_by_address(params[:query]).where(found: false).order(created_at: :desc)
    else
      @cats = Cat.where(found: false).order(created_at: :desc)
    end
  end

  private

  def set_sighting
    @sighting = Sighting.find(params[:id])
  end

  def set_cat
    @cat = Cat.find(params[:cat_id])
  end

  def sighting_params
    params.require(:sighting).permit(:address, :city, :description, :last_seen_at, :photo)
  end
end
