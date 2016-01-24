describe Spree::Api::V2::OptionTypesController do
  routes { Spree::Core::Engine.routes }

  let!(:option_type) { create :option_type }
  let(:product) { create :product, option_types: [option_type] }
  let(:new_product) { create :product }

  describe '#index' do
    it 'will list all option types' do
      get :index
      option_type_ids = parse_json(response.body)['data'].map do |option_type|
        option_type['id']
      end
      expect(option_type_ids).to include option_type.id.to_s
    end

    context 'by product' do
      it 'will list option types' do
        get :index, product_id: product.id
        option_type_ids = parse_json(response.body)['data'].map do |option_type|
          option_type['id']
        end
        expect(option_type_ids).to include option_type.id.to_s
      end

      it 'will not list option types belonging to a different product' do
        get :index, product_id: new_product.id
        data = parse_json(response.body)['data']
        expect(data).to be_empty
      end
    end
  end

  describe '#show' do
    it 'will find selected option_type by id' do
      get :show, id: option_type.id
      option_type_id = parse_json(response.body)['data']['id']
      expect(option_type_id).to eql option_type.id.to_s
    end

    context 'by product' do
      it 'will list option types' do
        get :show, id: option_type.id, product_id: product.id
        option_type_id = parse_json(response.body)['data']['id']
        expect(option_type_id).to eql option_type.id.to_s
      end

      it 'will not list option types belonging to a different product' do
        get :show, id: option_type.id, product_id: new_product.id
        expect(response).to have_http_status 404
      end
    end

    context 'by option value' do
      let(:option_value) { create :option_value, option_type: option_type }
      let(:new_option_value) { create :option_value }

      it 'will list option types' do
        get :show, option_value_id: option_value.id
        option_type_id = parse_json(response.body)['data']['id']
        expect(option_type_id).to eql option_type.id.to_s
      end

      it 'will not list option types belonging to a different option value' do
        get :show, option_value_id: new_option_value.id
        option_type_id = parse_json(response.body)['data']['id']
        expect(option_type_id).to_not eql option_type.id.to_s
      end
    end
  end
end
