require "minitest_helper"

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should log in user" do
    user = create(:user)
    post :create, email: user.email, password: 'password'

    assert_redirected_to root_url
    assert @controller.logged_in?
  end
end
