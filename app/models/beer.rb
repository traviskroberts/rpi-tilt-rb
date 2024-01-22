class Beer < ApplicationRecord
  acts_as_url :name, url_attribute: :slug

  has_many :tilt_data

  validates :name, presence: true, uniqueness: true
end
