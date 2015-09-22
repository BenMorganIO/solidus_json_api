describe Spree::Api::V2::TaxonomiesController do
  routes { Spree::Core::Engine.routes }

  let!(:taxonomy) { create :taxonomy }

  describe '#index' do
    it 'will list taxonomies' do
      get :index
      taxonomy_ids = parse_json(response.body)['data'].map do |taxonomy|
        taxonomy['id']
      end
      expect(taxonomy_ids).to include taxonomy.id.to_s
    end
  end

  describe '#show' do
    let(:taxon) { taxonomy.root }

    it 'will show taxonomy' do
      get :show, id: taxonomy.id
      taxonomy_id = parse_json(response.body)['data']['id']
      expect(taxonomy_id).to eql taxonomy.id.to_s
    end

    it 'can show taxonomy by taxon_id' do
      get :show, taxon_id: taxon.id
      taxonomy_id = parse_json(response.body)['data']['id']
      expect(taxonomy_id).to eql taxonomy.id.to_s
    end
  end
end
