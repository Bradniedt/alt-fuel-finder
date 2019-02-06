class StationPresenter
  attr_reader :stations
  def initialize(zip)
    @stations = Station.find_all(zip)
  end
end
