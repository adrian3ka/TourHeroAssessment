json.extract! booking_trip, :id, :user_id, :trip_id, :created_at, :updated_at
json.url booking_trip_url(booking_trip, format: :json)
