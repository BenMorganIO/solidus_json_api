describe Spree::Api::V2::ProductsController do
  routes { Spree::Core::Engine.routes }

  let!(:product) { create :product }
  let(:taxon) { create :taxon, products: [product] }
  let(:new_taxon) { create :taxon }

  describe '#index' do
    it 'will respond with products' do
      get :index
      expect(JSON.parse(response.body)['data'].size).to eql 1
    end

    context 'by taxon id' do
      it 'will respond with the taxons products' do
        get :index, taxon_id: taxon.id
        product_ids = parse_json(response.body)['data'].map do |products|
          products['id']
        end
        expect(product_ids).to include product.id.to_s
      end

      it 'will not respond with a product that is not associated to the taxon' do
        get :index, taxon_id: new_taxon.id
        product_ids = parse_json(response.body)['data'].map do |products|
          products['id']
        end
        expect(product_ids).to_not include product.id.to_s
      end
    end
  end

  describe '#show' do
    it 'will render the selected product' do
      get :show, id: product.id
      expect(parse_json(response.body)['data']['id']).to eql product.id.to_s
    end

    context 'by taxon id' do
      it 'will respond with the taxons products' do
        get :show, taxon_id: taxon.id, id: product.id
        product_id = parse_json(response.body)['data']['id']
        expect(product_id).to eql product.id.to_s
      end

      it 'will not respond with a product that is not associated to the taxon' do
        get :show, taxon_id: new_taxon.id, id: product.id
        expect(response).to have_http_status 404
      end
    end

    context 'by option type' do
      let(:option_type) { create :option_type, products: [product] }
      let(:new_option_type) { create :option_type }

      it 'will find product' do
        get :show, option_type_id: option_type.id, id: product.id
        product_id = parse_json(response.body)['data']['id']
        expect(product_id).to eql product.id.to_s
      end

      it 'will not find a product belong to a different option type' do
        get :show, option_type_id: new_option_type.id, id: product.id
        expect(response).to have_http_status 404
      end
    end

    context 'by variant id' do
      it 'will show its product' do
        get :show, variant_id: product.master.id
        product_id = parse_json(response.body)['data']['id']
        expect(product_id).to eql product.id.to_s
      end
    end

    context 'by price id' do
      it 'will show its product' do
        get :show, price_id: product.master.prices.first.id
        product_id = parse_json(response.body)['data']['id']
        expect(product_id).to eql product.id.to_s
      end
    end

    context 'by image id' do
      let(:image) { create :image }

      it 'will show its product' do
        product.images << image
        get :show, image_id: image.id
        product_id = parse_json(response.body)['data']['id']
        expect(product_id).to eql product.id.to_s
      end
    end
  end
end
