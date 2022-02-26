class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :firebase_uid
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :role
      t.integer :team_id
      t.string :avatar
      t.string :firebase_phone_number
      t.string :firebase_email
      t.boolean :firebase_email_verified
      t.string :firebase_provider_id
      t.string :firebase_display_name
      t.boolean :firebase_is_anonymous
      t.string :firebase_metadata_creationTime
      t.string :firebase_metadata_lastSigninTime
      t.string :firebase_client_version
      t.string :firebase_photo
      t.string :firebase_tenant_id

      t.timestamps
    end
  end
end
