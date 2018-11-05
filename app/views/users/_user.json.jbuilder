json.extract! user, :id, :first_name, :last_name, :created_at, :updated_at, :age, :gender, :address
json.url user_url(user, format: :json)