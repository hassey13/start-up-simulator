class User < ApplicationRecord

  has_many :personas
  has_many :products
  has_many :orders, through: :products
  has_many :factories, through: :orders
  has_many :product_distribution_centers
  has_many :distribution_centers, through: :product_distribution_centers

  has_secure_password

  

end
