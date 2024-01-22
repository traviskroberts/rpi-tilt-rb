require 'rails_helper'

describe Beer do
  describe 'associations' do
    it { is_expected.to have_many(:tilt_data) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
