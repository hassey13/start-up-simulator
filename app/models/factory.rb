class Factory < ApplicationRecord

  has_many :orders
  has_many :products, through: :orders
  has_one :persona
  has_one :user


end
