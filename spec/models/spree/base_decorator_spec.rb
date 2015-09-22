describe Spree::Base do
  it '.paginate' do
    # The pagination is concerned onto abstract models. There's not really a way
    # to be able to ensure that the model is paginated, so instead of ensuring
    # that the result is paginated (tested in the Spree::Api::BaseController),
    # this just makes sure it can respond to the +.paginate+ method.
    expect(described_class).to respond_to(:paginate).with(1).argument
  end
end
