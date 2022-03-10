require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup { @user = users(:one) }

  test 'visiting the index' do
    visit users_url
    assert_selector 'h1', text: 'Users'
  end

  test 'should create user' do
    visit users_url
    click_on 'New user'

    fill_in 'Client version', with: @user.client_version
    fill_in 'Display name', with: @user.display_name
    fill_in 'Email', with: @user.email
    check 'Email verified' if @user.email_verified
    fill_in 'Firebase photo', with: @user.firebase_photo
    check 'Is anonymous' if @user.is_anonymous
    fill_in 'Metadata creationtime', with: @user.metadata_creationTime
    fill_in 'Metadata lastsignintime', with: @user.metadata_lastSigninTime
    fill_in 'Phone number', with: @user.phone_number
    fill_in 'Provider', with: @user.provider_id
    fill_in 'Tenant', with: @user.tenant_id
    fill_in 'Uid', with: @user.uid
    fill_in 'User photo', with: @user.user_photo
    click_on 'Create User'

    assert_text 'User was successfully created'
    click_on 'Back'
  end

  test 'should update User' do
    visit user_url(@user)
    click_on 'Edit this user', match: :first

    fill_in 'Client version', with: @user.client_version
    fill_in 'Display name', with: @user.display_name
    fill_in 'Email', with: @user.email
    check 'Email verified' if @user.email_verified
    fill_in 'Firebase photo', with: @user.firebase_photo
    check 'Is anonymous' if @user.is_anonymous
    fill_in 'Metadata creationtime', with: @user.metadata_creationTime
    fill_in 'Metadata lastsignintime', with: @user.metadata_lastSigninTime
    fill_in 'Phone number', with: @user.phone_number
    fill_in 'Provider', with: @user.provider_id
    fill_in 'Tenant', with: @user.tenant_id
    fill_in 'Uid', with: @user.uid
    fill_in 'User photo', with: @user.user_photo
    click_on 'Update User'

    assert_text 'User was successfully updated'
    click_on 'Back'
  end

  test 'should destroy User' do
    visit user_url(@user)
    click_on 'Destroy this user', match: :first

    assert_text 'User was successfully destroyed'
  end
end
