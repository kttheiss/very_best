class UniqueListingsController < ApplicationController
  before_action :set_unique_listing, only: %i[show edit update destroy]

  def index
    @q = UniqueListing.ransack(params[:q])
    @unique_listings = @q.result(distinct: true).includes(:dish,
                                                          :venue).page(params[:page]).per(10)
  end

  def show; end

  def new
    @unique_listing = UniqueListing.new
  end

  def edit; end

  def create
    @unique_listing = UniqueListing.new(unique_listing_params)

    if @unique_listing.save
      message = "UniqueListing was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @unique_listing, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @unique_listing.update(unique_listing_params)
      redirect_to @unique_listing,
                  notice: "Unique listing was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @unique_listing.destroy
    message = "UniqueListing was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to unique_listings_url, notice: message
    end
  end

  private

  def set_unique_listing
    @unique_listing = UniqueListing.find(params[:id])
  end

  def unique_listing_params
    params.require(:unique_listing).permit(:dish_id, :venue_id)
  end
end
