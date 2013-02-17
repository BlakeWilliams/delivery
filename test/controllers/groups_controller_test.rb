require "minitest_helper"

class GroupsControllerTest < ActionController::TestCase
  setup do
    @user = create(:user)
    login_user
  end

  test "Should get new" do
    get :new
    assert_response :success
  end

  test "should create group" do
    attributes = attributes_for(:group)

    assert_difference 'Group.count' do
      post :create, group: attributes
    end

    assert_equal @user, assigns(:group).user
  end
end