require "rails_helper"

RSpec.describe UniqueListingResource, type: :resource do
  describe "serialization" do
    let!(:unique_listing) { create(:unique_listing) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(unique_listing.id)
      expect(data.jsonapi_type).to eq("unique_listings")
    end
  end

  describe "filtering" do
    let!(:unique_listing1) { create(:unique_listing) }
    let!(:unique_listing2) { create(:unique_listing) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: unique_listing2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([unique_listing2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:unique_listing1) { create(:unique_listing) }
      let!(:unique_listing2) { create(:unique_listing) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      unique_listing1.id,
                                      unique_listing2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      unique_listing2.id,
                                      unique_listing1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
