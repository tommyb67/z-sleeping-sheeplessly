require 'rails_helper'

describe 'navigate' do
  describe 'index' do
    it 'can be reached successfully' do
      visit banners_path
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Banners' do
      visit banners_path
      expect(page).to have_content(/Banners/)
    end
  end

    describe 'creation' do
      it 'has a new form that can be reached' do
        visit new_banner_path
        expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      visit new_banner_path

      fill_in 'banner[start_date]', with: Date.today
      fill_in 'banner[end_date]', with: Date.today
      fill_in 'banner[image]', with: ("Some address")
      fill_in 'banner[location]', with: ("Some location")

      click_on "Save"

      expect(page).to have_content("Some content")
    end
  end
end