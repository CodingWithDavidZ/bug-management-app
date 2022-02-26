json.extract! user, :id, :uid, :provider_id, :display_name, :email, :email_verified, :is_anonymous, :metadata_creationTime, :metadata_lastSigninTime, :client_version, :phone_number, :firebase_photo, :user_photo, :tenant_id, :created_at, :updated_at
json.url user_url(user, format: :json)
