class StationService
  def self.find_stations(location)
    conn = Faraday.new(url: "https://developer.nrel.gov/") do |f|
      f.adapter Faraday.default_adapter
    end
    response = conn.get("api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV['API_KEY']}&location=#{location}&&fuel_type=ELEC,LPG&radius=6&limit=10")
    results = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

end
