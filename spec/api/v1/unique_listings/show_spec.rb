require 'rails_helper'

RSpec.describe "unique_listings#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/unique_listings/#{unique_listing.id}", params: params
  end

  describe 'basic fetch' do
    let!(:unique_listing) { create(:unique_listing) }

    it 'works' do
      expect(UniqueListingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('unique_listings')
      expect(d.id).to eq(unique_listing.id)
    end
  end
end
