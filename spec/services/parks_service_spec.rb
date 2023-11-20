require 'rails_helper'
describe 'ParksService' do
  describe 'class methods' do
    it 'returns parks by state' do
      tennessee_parks = ParksService.get_parks_by_state('TN')

      expect(tennessee_parks).to be_a(Hash)
      expect(tennessee_parks).to have_key(:total)
      expect(tennessee_parks[:total]).to be_an(Integer)
      expect(tennessee_parks[:data]).to be_an(Array)
      expect(tennessee_parks[:data].first).to be_a(Hash)!!
    end
  end
end