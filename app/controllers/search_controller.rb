class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: "https://developer.nrel.gov/") do |f|
      f.adapter Faraday.default_adapter
    end
    location = params[:q]
    response = conn.get("api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['API_KEY']}&location=#{location}&&fuel_type=ELEC,LPG&radius=6&limit=10")

    @stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations].map do |data|
      Station.new(data)
    end
  end
end
