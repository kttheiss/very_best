require "rails_helper"

RSpec.describe "unique_listings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/unique_listings/#{unique_listing.id}"
  end

  describe "basic destroy" do
    let!(:unique_listing) { create(:unique_listing) }

    it "updates the resource" do
      expect(UniqueListingResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { UniqueListing.count }.by(-1)
      expect { unique_listing.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
