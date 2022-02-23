require 'rails_helper'

RSpec.describe "unique_listings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/unique_listings", params: params
  end

  describe 'basic fetch' do
    let!(:unique_listing1) { create(:unique_listing) }
    let!(:unique_listing2) { create(:unique_listing) }

    it 'works' do
      expect(UniqueListingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['unique_listings'])
      expect(d.map(&:id)).to match_array([unique_listing1.id, unique_listing2.id])
    end
  end
end
