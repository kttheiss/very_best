json.extract! unique_listing, :id, :dish_id, :venue_id, :created_at, :updated_at
json.url unique_listing_url(unique_listing, format: :json)
