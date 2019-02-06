class StationService
  def initialize(location)
    variables = "&location=#{location}&&fuel_type=ELEC,LPG&radius=6&limit=10"
    @url = "alt-fuel-stations/v1/nearest.json?api_key=#{ENV['API_KEY']}#{variables}"
    @conn = Faraday.new(url: "https://developer.nrel.gov/api/") do |f|
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
