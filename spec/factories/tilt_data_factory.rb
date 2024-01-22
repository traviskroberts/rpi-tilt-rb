FactoryBot.define do
  factory :tilt_data do
    beer
    temp_fahrenheit { 68 }
    temp_celsius { 21 }
    gravity { 1.042 }
    timestamp { 1.hour.ago }
  end
end
