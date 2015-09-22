describe Spree::Api::V2::ChildrenController do
  routes { Spree::Core::Engine.routes }

  let(:taxon) { create :taxon }
  let!(:child) { create :taxon, parent: taxon, taxonomy: taxon.taxonomy }

  describe '#index' do
    context 'by taxon' do
      it 'can list all the children' do
        get :index, taxon_id: taxon.id
        taxon_ids = parse_json(response.body)['data'].map do |taxon|
          taxon['id']
        end
        expect(taxon_ids).to include child.id.to_s
      end
    end
  end

  describe '#show' do
    context 'by taxon' do
      it 'will fetch the selected child' do
        get :show, taxon_id: taxon.id, id: child.id
        child_id = parse_json(response.body)['data']['id']
        expect(child_id).to eql child.id.to_s
      end
    end
  end
end
