class SearchController < ApplicationController
  def index
    @stations = StationPresenter.new(params[:q])
  end
end
