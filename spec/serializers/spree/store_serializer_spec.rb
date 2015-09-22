describe Spree::StoreSerializer do
  let(:store) { create :store }
  subject { ActiveModel::Serializer::Adapter::JsonApi.new(described_class.new store) }

  its(:to_json) do
    is_expected.to be_json_eql <<-JSON
      {
        "data" : {
           "attributes" : {
             "code" : "#{store.code}",
             "default" : #{store.default},
             "default_currency" : #{store.default_currency || 'null'},
             "mail_from_address" : "#{store.mail_from_address}",
             "meta_description" : null,
             "meta_keywords" : null,
             "name" : "#{store.name}",
             "seo_title" : null,
             "url" : "#{store.url}"
           },
           "type" : "spree_stores"
         }
       }
    JSON
  end
end
