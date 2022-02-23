require "rails_helper"

RSpec.describe "unique_listings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/unique_listings/#{unique_listing.id}", payload
  end

  describe "basic update" do
    let!(:unique_listing) { create(:unique_listing) }

    let(:payload) do
      {
        data: {
          id: unique_listing.id.to_s,
          type: "unique_listings",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(UniqueListingResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { unique_listing.reload.attributes }
    end
  end
end
