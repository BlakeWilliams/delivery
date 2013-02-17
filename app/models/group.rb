class Group < ActiveRecord::Base
  attr_accessible :address, :name, :user_id

  validates :address, presence: true, uniqueness: true
  validates :name, presence: true

  has_many :emails
  belongs_to :user
end
