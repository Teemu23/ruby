class PlacesController < ApplicationController
  def index
  end
  def show
    @place = BeermappingApi.places_in(params[:id])
  end

  def search
    @places = BeermappingApi.places_in(params[:city])
    if @places.empty?
      redirect_to places_path, notice: "No locations in #{params[:city]}"
    else
      session[:last_city] = "j"
      render :index
    end
  end

end