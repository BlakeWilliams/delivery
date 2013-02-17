require "minitest_helper"

class GroupTest < ActiveSupport::TestCase
  test 'should have a valid factory' do
    group = create(:group)
    assert group.valid?
  end

  test 'should require a name' do
    group = build(:group, name: nil)

    assert group.invalid?
  end

  test 'should require a unique address' do
    group = build(:group, address: nil)
    assert group.invalid?
    
    group = create(:group)
    group = build(:group, address: group.address)
    assert group.invalid?
  end

end
