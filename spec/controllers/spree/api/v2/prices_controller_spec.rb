describe Spree::Api::V2::PricesController do
  routes { Spree::Core::Engine.routes }

  let!(:price) { create :price }
  let(:new_variant) { create :variant }

  describe '#index' do
    it 'will list all prices' do
      get :index
      price_ids = parse_json(response.body)['data'].map do |price|
        price['id']
      end
      expect(price_ids).to include price.id.to_s
    end

    context 'by variant id' do
      it 'will list its prices' do
        get :index, variant_id: price.variant.id
        price_ids = parse_json(response.body)['data'].map do |price|
          price['id']
        end
        expect(price_ids).to include price.id.to_s
      end

      it 'will not list another variants prices' do
        get :index, variant_id: new_variant.id
        price_ids = parse_json(response.body)['data'].map do |price|
          price['id']
        end
        expect(price_ids).to_not include price.id.to_s
      end
    end
  end

  describe '#show' do
    it 'will show the price' do
      get :show, id: price.id
      price_id = parse_json(response.body)['data']['id']
      expect(price_id).to eql price.id.to_s
    end

    context 'by variant id' do
      it 'will show its prices' do
        get :show, id: price.id, variant_id: price.variant.id
        price_id = parse_json(response.body)['data']['id']
        expect(price_id).to eql price.id.to_s
      end

      it 'will not show another variants price' do
        get :show, id: price.id, variant_id: new_variant.id
        expect(response).to have_http_status 404
      end
    end
  end
end
