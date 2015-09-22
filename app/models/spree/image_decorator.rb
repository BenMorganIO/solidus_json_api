Spree::Image.class_eval do
  scope :variants, -> { where(viewable_type: 'Spree::Variant') }
end
