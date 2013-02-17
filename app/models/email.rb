class Email < ActiveRecord::Base
  attr_accessible :address

  belongs_to :group
end
