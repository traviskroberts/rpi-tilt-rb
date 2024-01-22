# frozen_string_literal: true

require 'rails_helper'

describe TiltData do
  describe 'associations' do
    it { is_expected.to belong_to(:beer) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:gravity) }
    it { is_expected.to validate_presence_of(:temp_celsius) }
    it { is_expected.to validate_presence_of(:temp_fahrenheit) }
    it { is_expected.to validate_presence_of(:timestamp) }
  end
end
