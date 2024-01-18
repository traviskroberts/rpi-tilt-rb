class TiltData < ApplicationRecord
  validates :gravity, presence: true
  validates :name, presence: true
  validates :temp_celsius, presence: true
  validates :temp_fahrenheit, presence: true
  validates :timestamp, presence: true

  scope :ordered_for_name, ->(name) { where(name: name).order(timestamp: :desc) }
end
