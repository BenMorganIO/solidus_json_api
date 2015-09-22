describe Spree::Api::V2::TaxonsController do
  routes { Spree::Core::Engine.routes }

  let!(:taxon) { create :taxon }

  describe '#index' do
    it 'will list the taxons' do
      get :index
      taxon_ids = parse_json(response.body)['data'].map do |taxon|
        taxon['id']
      end
      expect(taxon_ids).to include taxon.id.to_s
    end

    it 'can list the taxons filtered by taxonomy_id' do
      get :index, taxonomy_id: taxon.taxonomy.id
      taxon_ids = parse_json(response.body)['data'].map do |taxon|
        taxon['id']
      end
      expect(taxon_ids).to include taxon.id.to_s
    end
  end

  describe '#show' do
    it 'will show the selected taxon' do
      get :show, id: taxon.id
      taxon_id = parse_json(response.body)['data']['id']
      expect(taxon_id).to eql taxon.id.to_s
    end

    context 'by parent' do
      it 'can show a taxons parent' do
        child = create :taxon, parent: taxon
        get :show, taxon_id: child.id
        taxon_id = parse_json(response.body)['data']['id']
        expect(taxon_id).to eql taxon.id.to_s
      end
    end

    context 'by taxonomy_id' do
      it 'will fetch the selected taxon' do
        get :show, taxonomy_id: taxon.taxonomy.id, id: taxon.id
        taxon_id = parse_json(response.body)['data']['id']
        expect(taxon_id).to eql taxon.id.to_s
      end

      it 'when taxon does not belong to taxonomy' do
        new_taxonomy = create :taxonomy
        get :show, taxonomy_id: new_taxonomy.id, id: taxon.id
        expect(response).to have_http_status 404
      end
    end
  end
end
