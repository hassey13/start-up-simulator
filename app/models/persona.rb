class Persona < ApplicationRecord

  belongs_to :user
  has_many :products
  has_many :orders, through: :products
  has_many :factories
  has_many :product_distribution_centers
  has_many :distribution_centers, through: :product_distribution_centers

end
