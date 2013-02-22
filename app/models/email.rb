class Email < ActiveRecord::Base
  attr_accessible :address

  belongs_to :group

  validates :address, presence: true
  validates :address, uniqueness: { scope: :group_id, message: 'is already in this group' }
end
