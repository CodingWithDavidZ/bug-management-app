require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "Avatar", with: @user.avatar
    fill_in "Firebase access token", with: @user.firebase_access_token
    fill_in "Firebase client version", with: @user.firebase_client_version
    fill_in "Firebase display name", with: @user.firebase_display_name
    fill_in "Firebase email", with: @user.firebase_email
    check "Firebase email verified" if @user.firebase_email_verified
    check "Firebase is anonymous" if @user.firebase_is_anonymous
    fill_in "Firebase metadata creationtime", with: @user.firebase_metadata_creationTime
    fill_in "Firebase metadata lastsignintime", with: @user.firebase_metadata_lastSignInTime
    fill_in "Firebase phone number", with: @user.firebase_phone_number
    fill_in "Firebase photo", with: @user.firebase_photo
    fill_in "Firebase provider", with: @user.firebase_provider_id
    fill_in "Firebase tenant", with: @user.firebase_tenant_id
    fill_in "Firebase uid", with: @user.firebase_uid
    fill_in "First name", with: @user.first_name
    fill_in "Is team lead", with: @user.is_team_lead
    fill_in "Last name", with: @user.last_name
    fill_in "Password digest", with: @user.password_digest
    fill_in "Role", with: @user.role
    fill_in "Team", with: @user.team_id
    fill_in "Username", with: @user.username
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    fill_in "Avatar", with: @user.avatar
    fill_in "Firebase access token", with: @user.firebase_access_token
    fill_in "Firebase client version", with: @user.firebase_client_version
    fill_in "Firebase display name", with: @user.firebase_display_name
    fill_in "Firebase email", with: @user.firebase_email
    check "Firebase email verified" if @user.firebase_email_verified
    check "Firebase is anonymous" if @user.firebase_is_anonymous
    fill_in "Firebase metadata creationtime", with: @user.firebase_metadata_creationTime
    fill_in "Firebase metadata lastsignintime", with: @user.firebase_metadata_lastSignInTime
    fill_in "Firebase phone number", with: @user.firebase_phone_number
    fill_in "Firebase photo", with: @user.firebase_photo
    fill_in "Firebase provider", with: @user.firebase_provider_id
    fill_in "Firebase tenant", with: @user.firebase_tenant_id
    fill_in "Firebase uid", with: @user.firebase_uid
    fill_in "First name", with: @user.first_name
    fill_in "Is team lead", with: @user.is_team_lead
    fill_in "Last name", with: @user.last_name
    fill_in "Password digest", with: @user.password_digest
    fill_in "Role", with: @user.role
    fill_in "Team", with: @user.team_id
    fill_in "Username", with: @user.username
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end
