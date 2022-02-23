json.extract! venue, :id, :address, :dish_id, :google_maps_url,
              :neighborhood_id, :created_at, :updated_at
json.url venue_url(venue, format: :json)
