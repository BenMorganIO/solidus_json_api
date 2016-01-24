describe Spree::Api::V2::BaseController do
  controller do
    skip_before_action :authenticate_user

    def index
      render_collection Spree::Order
    end
  end

  describe '#filter_params' do
    before do
      allow(controller).to receive(:serializer_attributes) { Spree::OrderSerializer._attributes }
    end

    let!(:orders) do
      [create(:order), create(:order), create(:order, frontend_viewable: false)]
    end

    it 'can filter by a serializer\'s attribute' do
      first_order = orders.first
      get :index, filter: { id: first_order.id }
      order_ids = parse_json(response.body)['data'].map do |order|
        order['id']
      end
      expect(order_ids).to match [first_order.id.to_s]
    end

    it 'can filter multiple attributes' do
      first_order, second_order, _third_order = orders
      get :index, filter: { id: [first_order.id, second_order.id] }
      order_ids = parse_json(response.body)['data'].map do |order|
        order['id'].to_i
      end

      expect(order_ids).to match [first_order.id, second_order.id]
    end

    it 'will allow filtering of non-serializer attributes' do
      get :index, filter: { frontend_viewable: false }
      order_ids = parse_json(response.body)['data'].map do |order|
        order['id'].to_i
      end
      expect(order_ids).to match orders.map(&:id)
    end
  end
end
