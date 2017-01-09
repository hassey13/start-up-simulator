class DistributionCenter < ApplicationRecord

  has_one :user
  belongs_to :persona
  has_many :product_distribution_centers
  has_many :products, through: :product_distribution_centers


end
