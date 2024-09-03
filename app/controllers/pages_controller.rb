class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].present?
      @cats = Cat.search_by_city(params[:query])
    else
      @cats = Cat.all
    end
  end
end
