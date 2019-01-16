json.extract! user, :id, :username, :pass, :dob, :plan, :city, :country, :created_at, :updated_at
json.url user_url(user, format: :json)
