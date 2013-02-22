require "minitest_helper"

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect to groups if logged in" do
    @user = create(:user)
    login_user

    get :new
    assert_redirected_to groups_path
  end

  test "should create user" do
    attributes = attributes_for(:user)

    assert_difference 'User.count' do
      post :create, user: attributes
    end
  end
end
