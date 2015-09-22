describe Spree::Api::V2::OrdersController do
  routes { Spree::Core::Engine.routes }

  let(:order) { create :order }
  let(:user) { order.user }

  before { user.generate_spree_api_key! }

  describe '#show' do
    it 'will respond with the order' do
      get :show, token: user.spree_api_key, id: order.id
      expect(JSON.parse(response.body)['data']['type']).to eql 'spree_orders'
    end
  end
end
