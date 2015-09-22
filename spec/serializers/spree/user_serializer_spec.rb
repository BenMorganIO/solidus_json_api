describe Spree::UserSerializer do
  let(:user) { create :user }
  subject { ActiveModel::Serializer::Adapter::JsonApi.new(described_class.new user) }

  its(:to_json) do
    is_expected.to be_json_eql <<-JSON
      {
        "data" : {
          "attributes" : {
            "email" : "#{user.email}"
          },
          "type" : "spree_users"
        }
      }
    JSON
  end
end
