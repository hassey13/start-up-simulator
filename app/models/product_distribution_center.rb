class ProductDistributionCenter < ApplicationRecord

  has_one :user
  has_one :persona
  belongs_to :product
  belongs_to :distribution_center

end
