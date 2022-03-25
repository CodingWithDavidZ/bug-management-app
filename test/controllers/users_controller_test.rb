require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post users_url, params: { user: { avatar: @user.avatar, firebase_access_token: @user.firebase_access_token, firebase_client_version: @user.firebase_client_version, firebase_display_name: @user.firebase_display_name, firebase_email: @user.firebase_email, firebase_email_verified: @user.firebase_email_verified, firebase_is_anonymous: @user.firebase_is_anonymous, firebase_metadata_creationTime: @user.firebase_metadata_creationTime, firebase_metadata_lastSignInTime: @user.firebase_metadata_lastSignInTime, firebase_phone_number: @user.firebase_phone_number, firebase_photo: @user.firebase_photo, firebase_provider_id: @user.firebase_provider_id, firebase_tenant_id: @user.firebase_tenant_id, firebase_uid: @user.firebase_uid, first_name: @user.first_name, is_team_lead: @user.is_team_lead, last_name: @user.last_name, password_digest: @user.password_digest, role: @user.role, team_id: @user.team_id, username: @user.username } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { avatar: @user.avatar, firebase_access_token: @user.firebase_access_token, firebase_client_version: @user.firebase_client_version, firebase_display_name: @user.firebase_display_name, firebase_email: @user.firebase_email, firebase_email_verified: @user.firebase_email_verified, firebase_is_anonymous: @user.firebase_is_anonymous, firebase_metadata_creationTime: @user.firebase_metadata_creationTime, firebase_metadata_lastSignInTime: @user.firebase_metadata_lastSignInTime, firebase_phone_number: @user.firebase_phone_number, firebase_photo: @user.firebase_photo, firebase_provider_id: @user.firebase_provider_id, firebase_tenant_id: @user.firebase_tenant_id, firebase_uid: @user.firebase_uid, first_name: @user.first_name, is_team_lead: @user.is_team_lead, last_name: @user.last_name, password_digest: @user.password_digest, role: @user.role, team_id: @user.team_id, username: @user.username } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
