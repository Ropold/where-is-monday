class CatsController < ApplicationController
  before_action :set_cat, only: [:show]

  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to @cat
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
    params.require(:cat).permit(:name)
  end
end
