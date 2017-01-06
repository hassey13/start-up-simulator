class DistributionCenter < ApplicationRecord

  has_one :user
  has_one :persona
  has_many :product_distribution_centers
  has_many :products, through: :product_distribution_centers


end
