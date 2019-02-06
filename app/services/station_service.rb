class StationService
  def initialize(location)
    @url = "/v1/nearest.json?api_key=#{ENV['API_KEY']}&location=#{location}&&fuel_type=ELEC,LPG&radius=6&limit=10"
    @conn = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations") do |f|
      f.adapter Faraday.default_adapter
    end
  end

  def find_stations
    response = @conn.get(@url)
    results = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end

  def self.find_stations(zip)
    new(zip).find_stations
  end

end
