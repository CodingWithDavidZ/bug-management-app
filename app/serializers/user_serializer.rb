class UserSerializer < ActiveModel::Serializer
  attributes :id, :firebase_uid, :username, :first_name, :last_name, :role, :team_id, :avatar, :firebase_phone_number, :firebase_email, :firebase_email_verified, :firebase_provider_id, :firebase_display_name, :firebase_is_anonymous, :firebase_metadata_creationTime, :firebase_metadata_lastSigninTime, :firebase_client_version, :firebase_photo, :firebase_tenant_id
end
