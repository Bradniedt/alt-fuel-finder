require 'rails_helper'

describe 'As a user' do
  describe 'when I visit the root page and search a zip code' do
    it 'should list the 10 closest electric and propane stations within 6 miles sorted by distance' do
      VCR.use_cassette('stations') do
        visit '/'

        fill_in "q", with: 80203
        click_button("Locate")

        expect(current_path).to eq('/search')

        expect(page).to have_css(".station", count: 10)

        within(first(".station")) do
          expect(page).to have_css(".name")
          expect(page).to have_css(".address")
          expect(page).to have_css(".fuel_types")
          expect(page).to have_css(".distance")
          expect(page).to have_css(".access_times")
        end
      end 
    end
  end
end

# As a user
# When I visit "/"
# And I fill in the search form with 80203 (Note: Use the existing search form)
# And I click "Locate"
# Then I should be on page "/search"
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
