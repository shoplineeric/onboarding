json.extract! user, :id, :first_name, :last_name, :created_at, :updated_at, :age, :gender
json.url user_url(user, format: :json)