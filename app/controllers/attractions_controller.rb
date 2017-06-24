class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update]

  def index
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
  end

  def new
    @attraction = Attraction.new
  end

  def create
    if @attraction = Attraction.create(attraction_params)
      redirect_to @attraction
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @attraction.update(attraction_params)
      redirect_to @attraction
    else
      render :edit
    end
  end

  private

    def set_attraction
      @attraction = Attraction.find_by(:id => params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

end
