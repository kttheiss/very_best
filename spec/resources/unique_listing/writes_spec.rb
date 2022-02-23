require 'rails_helper'

RSpec.describe UniqueListingResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'unique_listings',
          attributes: { }
        }
      }
    end

    let(:instance) do
      UniqueListingResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { UniqueListing.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:unique_listing) { create(:unique_listing) }

    let(:payload) do
      {
        data: {
          id: unique_listing.id.to_s,
          type: 'unique_listings',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      UniqueListingResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { unique_listing.reload.updated_at }
      # .and change { unique_listing.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:unique_listing) { create(:unique_listing) }

    let(:instance) do
      UniqueListingResource.find(id: unique_listing.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { UniqueListing.count }.by(-1)
    end
  end
end
