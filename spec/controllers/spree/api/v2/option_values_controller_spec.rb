describe Spree::Api::V2::OptionValuesController do
  routes { Spree::Core::Engine.routes }

  let!(:option_value) { create :option_value }
  let(:new_option_value) { create :option_value }
  let(:variant) { create :variant, option_values: [option_value] }
  let(:new_variant) { create :variant }

  describe '#index' do
    it 'will list all option values' do
      get :index
      option_value_ids = parse_json(response.body)['data'].map do |option_value|
        option_value['id']
      end
      expect(option_value_ids).to include option_value.id.to_s
    end

    context 'by option type' do
      it 'will list all option values' do
        get :index, option_type_id: option_value.option_type.id
        option_value_ids = parse_json(response.body)['data'].map do |option_value|
          option_value['id']
        end
        expect(option_value_ids).to include option_value.id.to_s
      end

      it 'will not list option value belonging to a different option type' do
        get :index, option_type_id: new_option_value.option_type.id
        option_value_ids = parse_json(response.body)['data'].map do |option_value|
          option_value['id']
        end
        expect(option_value_ids).to_not include option_value.id.to_s
      end
    end

    context 'by variant' do
      it 'will list all option values' do
        get :index, variant_id: variant.id
        option_value_ids = parse_json(response.body)['data'].map do |option_value|
          option_value['id']
        end
        expect(option_value_ids).to include option_value.id.to_s
      end

      it 'will not list option value belonging to a different variant' do
        get :index, variant_id: new_variant.id
        option_value_ids = parse_json(response.body)['data'].map do |option_value|
          option_value['id']
        end
        expect(option_value_ids).to_not include option_value.id.to_s
      end
    end
  end

  describe '#show' do
    it 'will find selected option value by id' do
      get :show, id: option_value.id
      option_value_id = parse_json(response.body)['data']['id']
      expect(option_value_id).to eql option_value.id.to_s
    end

    context 'by option type' do
      it 'will find option value by option type' do
        get :show, option_type_id: option_value.option_type.id, id: option_value.id
        option_value_id = parse_json(response.body)['data']['id']
        expect(option_value_id).to eql option_value.id.to_s
      end

      it 'will not find option value belonging to a different option type' do
        get :show, option_type_id: new_option_value.option_type.id, id: option_value.id
        expect(response).to have_http_status 404
      end
    end

    context 'by variant' do
      it 'will find option value by option type' do
        get :show, variant_id: variant.id, id: option_value.id
        option_value_id = parse_json(response.body)['data']['id']
        expect(option_value_id).to eql option_value.id.to_s
      end

      it 'will not find option value belonging to a different option type' do
        get :show, variant_id: new_variant.id, id: option_value.id
        expect(response).to have_http_status 404
      end
    end
  end
end
