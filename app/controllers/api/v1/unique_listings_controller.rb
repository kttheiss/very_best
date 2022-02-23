class Api::V1::UniqueListingsController < Api::V1::GraphitiController
  def index
    unique_listings = UniqueListingResource.all(params)
    respond_with(unique_listings)
  end

  def show
    unique_listing = UniqueListingResource.find(params)
    respond_with(unique_listing)
  end

  def create
    unique_listing = UniqueListingResource.build(params)

    if unique_listing.save
      render jsonapi: unique_listing, status: :created
    else
      render jsonapi_errors: unique_listing
    end
  end

  def update
    unique_listing = UniqueListingResource.find(params)

    if unique_listing.update_attributes
      render jsonapi: unique_listing
    else
      render jsonapi_errors: unique_listing
    end
  end

  def destroy
    unique_listing = UniqueListingResource.find(params)

    if unique_listing.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: unique_listing
    end
  end
end
