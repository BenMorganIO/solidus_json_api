describe SolidusJsonApi do
  describe '.setup' do
    it 'can set the parent serializer' do
      class DescendantOfAMS < ActiveModel::Serializer; end

      described_class.setup { |c| c.parent_serializer = DescendantOfAMS }
      expect(described_class.parent_serializer).to eql DescendantOfAMS
    end
  end
end
