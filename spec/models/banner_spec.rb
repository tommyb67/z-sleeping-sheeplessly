require 'rails_helper'

RSpec.describe Banner, type: :model do
  describe "Creation" do
    before do
      @banner = FactoryGirl.create(:banner)
    end

    it 'can be created' do
      expect(@banner).to be_valid
    end

    it 'cannot be created without start date, end date, image and location' do
      @banner.start_date = nil
      @banner.end_date = nil
      @banner.image = nil
      @banner.location = nil
      expect(@banner).to_not be_valid
    end
  end
end
