require "minitest_helper"

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    attributes = attributes_for(:user)

    assert_difference 'User.count' do
      post :create, user: attributes
    end
  end
end
