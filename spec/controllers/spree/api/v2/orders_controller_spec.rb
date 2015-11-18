describe Spree::Api::V2::OrdersController do
  routes { Spree::Core::Engine.routes }

  let(:order) { create :order }
  let(:user) { order.user }
  let(:admin) { create :admin_user }

  before { user.generate_spree_api_key! }

  describe '#index' do
    context 'when admin' do
      before { admin.generate_spree_api_key! }

      it 'will list all orders' do
        get :index, token: admin.spree_api_key
        ids = JSON.parse(response.body)['data'].map { |d| d['id'].to_i }
        expect(ids).to include order.id
      end
    end

    context 'when user' do
      let!(:new_order) { create :order }

      before { get :index, token: user.spree_api_key }

      it 'will not list another users order' do
        ids = JSON.parse(response.body)['data'].map { |d| d['id'].to_i }
        expect(ids).to_not include new_order.id
      end

      it 'will list the current users orders' do
        ids = JSON.parse(response.body)['data'].map { |d| d['id'].to_i }
        expect(ids).to include order.id
      end
    end
  end

  describe '#show' do
    context 'when admin' do
      before { admin.generate_spree_api_key! }

      it 'can respond with another users order' do
        get :show, token: admin.spree_api_key, id: order.id
        expect(JSON.parse(response.body)['data']['type']).to eql 'spree_orders'
      end
    end

    context 'when user' do
      it 'will not respond with another users order' do
        new_order = create :order
        get :show, token: user.spree_api_key, id: new_order.id
        expect(response).to have_http_status 404
      end

      it 'will respond with the current users order' do
        get :show, token: user.spree_api_key, id: order.id
        expect(JSON.parse(response.body)['data']['id'].to_i).to eql order.id
      end
    end
  end
end
