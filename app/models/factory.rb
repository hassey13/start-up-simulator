class Factory < ApplicationRecord

  has_many :orders
  has_many :products, through: :orders
  belongs_to :persona
  has_one :user

  def self.add_default_factories(persona_id)
    factories = [
      {
      name: "JYEF",
      production_rating: 60,
      quality_rating: 1,
      cost_rating: 1,
      cost: 0,
      availability: true,
      persona_id: persona_id
      },
      {
      name: "Speedy Manufacturing",
      production_rating: 60,
      quality_rating: 0.75,
      cost_rating: 1.10,
      cost: 100,
      availability: false,
      persona_id: persona_id
      },
      {
      name: "BQ Manufacturing",
      production_rating: 60,
      quality_rating: 1.50,
      cost_rating: 1.25,
      cost: 100,
      availability: false,
      persona_id: persona_id
      },
      {
      name: "Cheep Manufacturing",
      production_rating: 60,
      quality_rating: 0.50,
      cost_rating: 0.75,
      cost: 100,
      availability: false,
      persona_id: persona_id
      },
      {
      name: "Premier Manufacturing",
      production_rating: 60,
      quality_rating: 1.25,
      cost_rating: 0.75,
      cost: 100,
      availability: false,
      persona_id: persona_id
      }
    ]

    factories.each do |factory|
      Factory.create(factory)
    end
  end

end
