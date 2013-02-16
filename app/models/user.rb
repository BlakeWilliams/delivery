class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, :on => :create
  validates :password, confirmation: true, :on => :update, if: ->{password.present?}
end
