class CatsController < ApplicationController
  before_action :set_cat, only: [:show, :edit, :update, :destroy]

  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(params)

    if @cat.save
      redirect_to @cat
    else
      render :new
    end
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def params
    params.require(:cat).permit(:name, :description, :location, :status)
  end
end
