describe Spree::Price do
  it { is_expected.to delegate_method(:product).to :variant }
end
