json.array!(@users) do |user|
  json.extract! user, :id, :user_id, :user_email, :user_password_digest, :user_name, :perission_level, :created_at, :updated_at, :status
  json.url user_url(user, format: :json)
end
