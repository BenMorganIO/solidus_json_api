Spree::State.class_eval do
  scope :find_country, -> (id) { includes(:country).find(id).country }
end
