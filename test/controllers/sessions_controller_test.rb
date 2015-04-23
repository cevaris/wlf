require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = FactoryGirl.create(:user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user session" do
    post :create, user: {
           email: @user.email,
           password: 'password',
         }
    assert warden.authenticate? @user
    assert_redirected_to '/'
  end

  test "should not create user session" do
    post :create, user: {
           email: @user.email,
           password: 'invalid_password',
         }
    assert warden.authenticate?(@user) == false
    assert_response :success
    assert flash.empty? == false
    assert flash['alert'] == 'Invalid email or password.'
  end
end
