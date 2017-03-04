require 'rails_helper'

describe 'navigate' do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end

  describe 'index' do
    before do
      visit banners_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Banners' do
      expect(page).to have_content(/Banners/)
    end

    it 'has a list of banner requests' do
      banner1 = FactoryGirl.build_stubbed(:banner)
      banner2 = FactoryGirl.build_stubbed(:second_banner)
      visit banners_path
      expect(page).to have_content(/Start Date|End Date/)
    end
  end

    describe 'creation' do
      before do
        visit new_banner_path
      end

      it 'has a new form that can be reached' do
        expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'banner[start_date]', with: Date.today
      fill_in 'banner[end_date]', with: Date.today
      fill_in 'banner[image]', with: ("Some address")
      fill_in 'banner[location]', with: ("Some location")
      click_on "Save"
      expect(page).to have_content("Some location")
    end

    it 'will have a user associated with it' do
      fill_in 'banner[start_date]', with: Date.today
      fill_in 'banner[end_date]', with: Date.today
      fill_in 'banner[image]', with: ("Some address")
      fill_in 'banner[location]', with: ("User Association")
      click_on "Save"

      expect(User.last.banners.last.location).to eq("User Association")
    end
  end

  describe 'edit' do
    before do
      @banner = FactoryGirl.create(:banner)
    end

    it 'can be reached by clicking edit on index page' do
      visit banners_path

      click_link("edit_#{@banner.id}")
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_banner_path(@banner)

      fill_in 'banner[start_date]', with: Date.today
      fill_in 'banner[end_date]', with: Date.today
      fill_in 'banner[image]', with: ("Some address")
      fill_in 'banner[location]', with: ("Edited content")
      click_on "Save"
      expect(page).to have_content("Edited content")
    end
  end
end