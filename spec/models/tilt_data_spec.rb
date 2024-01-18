# frozen_string_literal: true

require 'rails_helper'

describe TiltData do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:gravity) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:temp_celsius) }
    it { is_expected.to validate_presence_of(:temp_fahrenheit) }
    it { is_expected.to validate_presence_of(:timestamp) }
  end

  describe '.ordered_for_name' do
    let!(:foo_beer_1) { create(:tilt_data, name: 'foo beer', timestamp: 2.hours.ago) }
    let!(:foo_beer_2) { create(:tilt_data, name: 'foo beer', timestamp: 5.hours.ago) }
    let!(:foo_beer_3) { create(:tilt_data, name: 'foo beer', timestamp: 3.hours.ago) }
    let!(:bar_beer_1) { create(:tilt_data, name: 'bar beer', timestamp: 2.hours.ago) }

    it 'returns data for the specified name, ordered by timestamp' do
      expect(described_class.ordered_for_name('foo beer')).to eq([foo_beer_1, foo_beer_3, foo_beer_2])
    end
  end
end
