require "minitest_helper"

class EmailsControllerTest < ActionController::TestCase
  setup do
    @user = create(:user)
    login_user
    @group = create(:group)
  end

  test "should create email" do
    attributes = attributes_for(:email)

    assert_difference 'Email.count' do
      post :create, group_id: @group.id, email: attributes
    end

    assert_equal @group, assigns(:email).group
  end

  test "should destroy email" do
    email = create(:email, group_id: @group.id)

    assert_difference 'Email.count', -1 do
      delete :destroy, group_id: @group.id, id: email.id
    end
  end
end
