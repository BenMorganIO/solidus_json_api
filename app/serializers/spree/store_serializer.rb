module Spree
  class StoreSerializer < Spree::BaseSerializer
    attributes :name, :url, :meta_description, :meta_keywords, :seo_title,
               :mail_from_address, :default_currency, :code, :default
  end
end
