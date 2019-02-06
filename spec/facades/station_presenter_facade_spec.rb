require 'rails_helper'

describe StationPresenter do
  it 'exists' do
    VCR.use_cassette('stations') do
      presenter = StationPresenter.new(80203)

      expect(presenter).to be_an_instance_of StationPresenter
    end
  end
  it 'has stations' do
    VCR.use_cassette('stations') do
      presenter = StationPresenter.new(80203)

      expect(presenter.stations[0]).to be_an_instance_of Station
      expect(presenter.stations.length).to eq(10)
    end
  end
end
