describe Spree::Api::V2::VariantsController do
  routes { Spree::Core::Engine.routes }

  let!(:variant) { create :variant }
  let(:new_option_value) { create :option_value }

  describe '#index' do
    it 'will list all variants' do
      get :index
      variant_ids = parse_json(response.body)['data'].map do |variant|
        variant['id']
      end
      expect(variant_ids).to include variant.id.to_s
    end

    context 'by product id' do
      let(:new_product) { create :product }

      it 'will list its variants' do
        get :index, product_id: variant.product.id
        variant_ids = parse_json(response.body)['data'].map do |variant|
          variant['id']
        end
        expect(variant_ids).to include variant.id.to_s
      end

      it 'will not list another products variants' do
        get :index, product_id: new_product.id
        variant_ids = parse_json(response.body)['data'].map do |variant|
          variant['id']
        end
        expect(variant_ids).to_not include variant.id.to_s
      end
    end

    context 'by option value' do
      it 'will list its variants' do
        get :index, option_value_id: variant.option_values.first.id
        variant_ids = parse_json(response.body)['data'].map do |variant|
          variant['id']
        end
        expect(variant_ids).to include variant.id.to_s
      end

      it 'will not list another products variant' do
        get :index, option_value_id: new_option_value.id
        data = parse_json(response.body)['data']
        expect(data).to be_empty
      end
    end
  end

  describe '#show' do
    it 'will show the variant' do
      get :show, id: variant.id
      variant_id = parse_json(response.body)['data']['id']
      expect(variant_id).to eql variant.id.to_s
    end

    context 'by product id' do
      let(:new_product) { create :product }

      it 'will show its variant' do
        get :show, id: variant.id, product_id: variant.product.id
        variant_id = parse_json(response.body)['data']['id']
        expect(variant_id).to eql variant.id.to_s
      end

      it 'will not show another products variant' do
        get :show, id: variant.id, product_id: new_product.id
        expect(response).to have_http_status 404
      end
    end

    context 'by option_value id' do
      it 'will show its variant' do
        get :show, id: variant.id, option_value_id: variant.option_values.first.id
        variant_id = parse_json(response.body)['data']['id']
        expect(variant_id).to eql variant.id.to_s
      end

      it 'will not show another option_values variant' do
        get :show, id: variant.id, option_value_id: new_option_value.id
        expect(response).to have_http_status 404
      end
    end

    context 'by price id' do
      it 'will show its variant' do
        get :show, price_id: variant.prices.first.id
        variant_id = parse_json(response.body)['data']['id']
        expect(variant_id).to eql variant.id.to_s
      end
    end

    context 'by image id' do
      let(:image) { create :image, viewable: variant }

      it 'will show its variant' do
        get :show, image_id: image.id
        variant_id = parse_json(response.body)['data']['id']
        expect(variant_id).to eql variant.id.to_s
      end
    end
  end
end
