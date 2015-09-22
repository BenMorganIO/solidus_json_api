describe Spree::Api::V2::CountriesController do
  routes { Spree::Core::Engine.routes }

  let!(:country) { create :country }
  let(:state) { create :state, country: country }

  describe '#index' do
    it 'will list all countries' do
      get :index
      expect(JSON.parse(response.body)['data'].length).to eql 1
    end
  end

  describe '#show' do
    it 'will list the selected country' do
      get :show, id: country.id
      expect(JSON.parse(response.body)['data']['id']).to eql country.id.to_s
    end

    it 'will the country via a state' do
      get :show, state_id: state.id
      expect(JSON.parse(response.body)['data']['id']).to eql country.id.to_s
    end
  end
end
