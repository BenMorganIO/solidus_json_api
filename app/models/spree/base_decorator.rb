Spree::Base.class_eval do
  def self.paginate(page_attrs)
    page(page_attrs[:number]).per(page_attrs[:size])
  end
end
