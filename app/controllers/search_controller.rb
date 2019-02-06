class SearchController < ApplicationController
  def index
    binding.pry
    conn = Faraday.new(url: "https://developer.nrel.gov/") do |f|
      f.headers[api_key] = ENV["API_KEY"]
      f.adapter Faraday.default_adapter
    end
    location = params[:location]
    response = conn.get("api/alt-fuel-stations/v1/nearest.json?location=#{location}&&fuel_type=ELEC,LPG&radius=6&limit=10")

    @stations = JSON.parse(response.body, symbolize_names: true)[:fuel_stations].map do |data|
      Station.new(data)
    end
    
  end
end
