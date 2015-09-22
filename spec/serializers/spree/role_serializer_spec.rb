describe Spree::RoleSerializer do
  let(:role) { create :role }
  subject { ActiveModel::Serializer::Adapter::JsonApi.new(described_class.new role) }

  its(:to_json) do
    is_expected.to be_json_eql <<-JSON
      {
        "data" : {
          "attributes" : {
            "name" : "#{role.name}"
          },
          "type" : "spree_roles"
        }
      }
    JSON
  end
end
