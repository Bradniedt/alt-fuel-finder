class SearchController < ApplicationController
  def index
    @stations = Station.find_all(params[:q])
  end
end
