require 'rails_helper'

describe Station, type: :model do
  describe 'attributes' do
    data = { station_name: "station1",
             street_address: "123 street",
             city: "denver",
             state: "CO",
             zip: 80201,
             fuel_type_code: "ELEC",
             distance: 6,
             access__days_time: "24hrs" }
    station = Station.new(data)

    expect(station).to be_an_instance_of Station
    expect(station.name).to eq(data[:name])
    expect(station.address).to eq(data[:address])
    expect(station.fuel_types).to eq(data[:fuel_types])
    expect(station.distance).to eq(data[:distance])
    expect(station.access_times).to eq(data[:access_times])
  end
end