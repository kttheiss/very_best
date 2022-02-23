class UniqueListingsController < ApplicationController
  before_action :set_unique_listing, only: [:show, :edit, :update, :destroy]

  # GET /unique_listings
  def index
    @unique_listings = UniqueListing.all
  end

  # GET /unique_listings/1
  def show
  end

  # GET /unique_listings/new
  def new
    @unique_listing = UniqueListing.new
  end

  # GET /unique_listings/1/edit
  def edit
  end

  # POST /unique_listings
  def create
    @unique_listing = UniqueListing.new(unique_listing_params)

    if @unique_listing.save
      message = 'UniqueListing was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @unique_listing, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /unique_listings/1
  def update
    if @unique_listing.update(unique_listing_params)
      redirect_to @unique_listing, notice: 'Unique listing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /unique_listings/1
  def destroy
    @unique_listing.destroy
    message = "UniqueListing was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to unique_listings_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unique_listing
      @unique_listing = UniqueListing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def unique_listing_params
      params.require(:unique_listing).permit(:dish_id, :venue_id)
    end
end
