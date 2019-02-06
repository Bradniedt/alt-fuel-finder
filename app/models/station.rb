class Station
  attr_reader :name, :address, :fuel_types, :distance, :access_times
  def initialize(data)
    @name = data[:station_name]
    @address = "#{data[:street_address]}, #{data[:city]}, #{data[:state]} #{data[:zip]}"
    @fuel_types = data[:fuel_type_code]
    @distance = data[:distance]
    @access_times = data[:access_days_time]
  end

  def self.find_all(location)
    stations = StationService.find_stations(location).map do |data|
      Station.new(data)
    end
  end
end
