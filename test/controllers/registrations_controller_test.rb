require 'test_helper'

class RegistrationsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @user = FactoryGirl.build(:user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count', 1) do
      post :create, user: {
             email: @user.email,
             password: 'password',
             account_attributes: {
               first_name: @user.account.first_name,
               last_name: @user.account.last_name,
             }
           }
      binding.pry
    end

    assert_redirected_to account_path(assigns(:user))
  end
end
