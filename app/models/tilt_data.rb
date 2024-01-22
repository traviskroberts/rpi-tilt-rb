class TiltData < ApplicationRecord
  belongs_to :beer
  
  validates :gravity, presence: true
  validates :temp_celsius, presence: true
  validates :temp_fahrenheit, presence: true
  validates :timestamp, presence: true
end
