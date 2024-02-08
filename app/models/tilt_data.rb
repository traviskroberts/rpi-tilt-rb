class TiltData < ApplicationRecord
  belongs_to :beer

  validates :gravity, presence: true
  validates :temp_celsius, presence: true
  validates :temp_fahrenheit, presence: true
  validates :timestamp, presence: true

  def self.ransackable_associations(auth_object = nil)
    ["beer"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["beer_id"]
  end
end
