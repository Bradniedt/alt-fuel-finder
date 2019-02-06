require 'rails_helper'

describe Station, type: :model do
  it 'attributes' do
    data = { station_name: "station1",
             street_address: "123 street",
             city: "denver",
             state: "CO",
             zip: 80201,
             fuel_type_code: "ELEC",
             distance: 6,
             access_days_time: "24hrs" }
    station = Station.new(data)

    expect(station).to be_an_instance_of Station
    expect(station.name).to eq(data[:station_name])
    expect(station.address).to eq("#{data[:street_address]}, #{data[:city]}, #{data[:state]} #{data[:zip]}")
    expect(station.fuel_types).to eq(data[:fuel_type_code])
    expect(station.distance).to eq(data[:distance])
    expect(station.access_times).to eq(data[:access_days_time])
  end
end
