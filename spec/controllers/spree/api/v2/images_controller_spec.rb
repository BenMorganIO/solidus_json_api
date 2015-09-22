describe Spree::Api::V2::ImagesController do
  routes { Spree::Core::Engine.routes }

  let!(:image) { create :image }

  let(:product) { create :product }
  let(:new_product) { create :product }

  let(:variant) { create :variant, images: [image] }
  let(:new_variant) { create :variant, images: [create(:image)] }

  describe '#index' do
    it 'will list the images' do
      get :index
      image_ids = parse_json(response.body)['data'].map do |image|
        image['id']
      end
      expect(image_ids).to include image.id.to_s
    end

    context 'by product id' do
      it 'will list its images' do
        product.images << image
        get :index, product_id: product.id
        image_ids = parse_json(response.body)['data'].map do |image|
          image['id']
        end
        expect(image_ids).to include image.id.to_s
      end

      it 'will not list another products images' do
        get :index, product_id: new_product.id
        image_ids = parse_json(response.body)['data'].map do |image|
          image['id']
        end
        expect(image_ids).to_not include image.id.to_s
      end
    end

    context 'by variant id' do
      it 'will list its images' do
        get :index, variant_id: variant.id
        image_ids = parse_json(response.body)['data'].map do |image|
          image['id']
        end
        expect(image_ids).to include image.id.to_s
      end

      it 'will not list another variants images' do
        get :index, variant_id: new_variant.id
        image_ids = parse_json(response.body)['data'].map do |image|
          image['id']
        end
        expect(image_ids).to_not include image.id.to_s
      end
    end
  end

  describe '#show' do
    it 'will show the image' do
      get :show, id: image.id
      image_id = parse_json(response.body)['data']['id']
      expect(image_id).to eql image.id.to_s
    end

    context 'by product id' do
      it 'will show its image' do
        product.images << image
        get :show, id: image.id, product_id: product.id
        image_id = parse_json(response.body)['data']['id']
        expect(image_id).to eql image.id.to_s
      end

      it 'will not show another products image' do
        get :show, id: image.id, product_id: new_product.id
        expect(response).to have_http_status 404
      end
    end

    context 'by variant id' do
      it 'will show its image' do
        get :show, id: image.id, variant_id: variant.id
        image_id = parse_json(response.body)['data']['id']
        expect(image_id).to eql image.id.to_s
      end

      it 'will not show another products image' do
        get :show, id: image.id, variant_id: new_variant.id
        expect(response).to have_http_status 404
      end
    end
  end
end
