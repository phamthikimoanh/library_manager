json.extract! user, :id, :name, :birthday, :phone, :address, :image, :created_at, :updated_at
json.url user_url(user, format: :json)
