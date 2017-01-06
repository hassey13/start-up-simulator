class Order < ApplicationRecord

  belongs_to :product
  belongs_to :factory
  has_one :persona
  has_one :user

end
