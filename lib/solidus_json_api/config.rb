module SolidusJsonApi
  mattr_accessor :parent_serializer
  @@parent_serializer = ActiveModel::Serializer

  def self.setup
    yield self
  end
end
