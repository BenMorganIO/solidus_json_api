Spree::Price.class_eval do
  delegate :product, to: :variant
end
