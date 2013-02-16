require "minitest_helper"

class UserTest < ActiveSupport::TestCase
  test 'should have a valid factory' do
    user = create(:user)
    assert user.valid?
  end

  test 'should require a unique email address' do
    user = create(:user)
    user = build(:user, email: user.email)

    assert user.invalid?
  end

  test 'should require an email address' do
    user = build(:user, email: nil)
    assert user.invalid?
  end

  test 'should require a password' do
    user = build(:user, password: nil)
    assert user.invalid?
  end
end
