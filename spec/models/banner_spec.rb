require 'rails_helper'

RSpec.describe Banner, type: :model do
  describe "Creation" do
    before do
      @banner = Banner.create(start_date: Date.today, end_date: Date.tomorrow, image: "K:/banners/sleeping", location: "jumbotron 1", headline: "Sleeping Sheeplessly!", subcopy: "Your Sheep counting days are over!")
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
