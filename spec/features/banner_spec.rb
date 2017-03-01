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
      before do
        user = User.create(email: "test@test.com", password: "abcdef", password_confirmation: "abcdef", first_name: "William", last_name: "Yeats")
        login_as(user, :scope => :user)
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
      expect(page).to have_content("Some content")
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
end