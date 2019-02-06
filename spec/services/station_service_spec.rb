require 'rails_helper'

describe StationService, type: :model do
  it 'exists' do
    service = StationService.new(80203)

    expect(service).to be_an_instance_of StationService
  end
  it 'returns a collection of station data filtered by zip' do
    hashes = StationService.find_stations(80203)
    station = hashes.first

    expect(hashes.count).to eq(10)
    expect(station).to have_key(:station_name)
    expect(station).to have_key(:street_address)
    expect(station).to have_key(:city)
    expect(station).to have_key(:state)
    expect(station).to have_key(:zip)
    expect(station).to have_key(:fuel_type_code)
    expect(station).to have_key(:distance)
    expect(station).to have_key(:access_days_time)
  end
end
