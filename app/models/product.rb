class Product < ApplicationRecord

  has_one :user
  belongs_to :persona
  has_many :orders
  has_many :factories, through: :orders
  has_many :product_distribution_centers
  has_many :distribution_centers, through: :product_distribution_centers

end
