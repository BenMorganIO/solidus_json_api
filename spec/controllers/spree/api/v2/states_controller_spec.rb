describe Spree::Api::V2::StatesController do
  routes { Spree::Core::Engine.routes }

  let!(:state) { create :state }

  describe '#index' do
    it 'can list all states' do
      get :index
      expect(JSON.parse(response.body)['data'].length).to eql 1
    end

    context 'by country id' do
      it 'will list selected states by country' do
        get :index, country_id: state.country.id
        expect(JSON.parse(response.body)['data'].length).to eql 1
      end

      it 'will not include states belonging to other countries' do
        new_state = create :state
        get :index, country_id: state.country.id
        state_ids = JSON.parse(response.body)['data'].map do |states|
          states['id']
        end
        expect(state_ids).to_not include new_state
      end
    end
  end

  describe '#show' do
    it 'will find selected state by id' do
      get :show, id: state.id
      state_id = parse_json(response.body)['data']['id']
      expect(state_id).to eql state.id.to_s
    end

    it 'can find a state by a country' do
      get :show, country_id: state.country.id, id: state.id
      state_id = parse_json(response.body)['data']['id']
      expect(state_id).to eql state.id.to_s
    end
  end
end
