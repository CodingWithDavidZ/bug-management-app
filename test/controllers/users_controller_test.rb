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
      post users_url, params: { user: { client_version: @user.client_version, display_name: @user.display_name, email: @user.email, email_verified: @user.email_verified, firebase_photo: @user.firebase_photo, is_anonymous: @user.is_anonymous, metadata_creationTime: @user.metadata_creationTime, metadata_lastSigninTime: @user.metadata_lastSigninTime, phone_number: @user.phone_number, provider_id: @user.provider_id, tenant_id: @user.tenant_id, uid: @user.uid, user_photo: @user.user_photo } }
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
    patch user_url(@user), params: { user: { client_version: @user.client_version, display_name: @user.display_name, email: @user.email, email_verified: @user.email_verified, firebase_photo: @user.firebase_photo, is_anonymous: @user.is_anonymous, metadata_creationTime: @user.metadata_creationTime, metadata_lastSigninTime: @user.metadata_lastSigninTime, phone_number: @user.phone_number, provider_id: @user.provider_id, tenant_id: @user.tenant_id, uid: @user.uid, user_photo: @user.user_photo } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference("User.count", -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
