class SearchController < ApplicationController
  def index
    @presenter = StationPresenter.new(params[:q])
  end
end
