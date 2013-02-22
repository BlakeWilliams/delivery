require "minitest_helper"

class GroupsControllerTest < ActionController::TestCase
  setup do
    @user = create(:user)
    login_user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    group = create(:group)
    get :show, id: group.id

    assert_response :success
  end

  test "should get new" do
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

  test "should get edit" do
    group = create(:group)
    get :edit, id: group.id

    assert_response :success
  end

  test "should update group" do
    group = create(:group)
    put :update, id: group.id, group: { name: 'New Name' }

    assert_redirected_to groups_path
    assert_equal 'New Name', assigns(:group).name
  end

  test "should destroy group" do
    group = create(:group)

    assert_difference 'Group.count', -1  do
      delete :destroy, id: group.id
    end
    
    assert_redirected_to groups_path
  end
end
