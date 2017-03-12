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

    it 'has a list of banner submissions' do
      banner1 = FactoryGirl.build_stubbed(:banner)
      banner2 = FactoryGirl.build_stubbed(:second_banner)
      visit banners_path
      expect(page).to have_content(/Start Date|End Date/)
    end

    it 'has a scope so that only banner submission creators can see their own banner submissions' do
     banner1 = Banner.create(start_date: Date.today, end_date: Date.tomorrow, image: 'ghjk', location: 'ghjk', user_id: @user.id)
      banner2 = Banner.create(start_date: Date.today, end_date: Date.tomorrow, image: 'ghjk', location: 'ghjk', user_id: @user.id)

      other_user = User.create(first_name: 'Non', last_name: 'Authorized', email: 'nonauthemail@example.com', password: 'acbdef', password_confirmation: 'abcdef')
      banner_from_other_user = Banner.create(start_date: Date.today, end_date: Date.tomorrow, image: 'ghjk', location: 'this location', user_id: other_user.id)

      visit banners_path

      expect(page).to_not have_content(/this location/)
    end
  end

  describe 'new' do
    it 'has a link from the homepage' do
      visit root_path

      click_link("new_banner_from_nav")
      expect(page.status_code).to eq(200)
    end
  end

 describe 'delete' do
  it 'can be deleted' do
    @banner = FactoryGirl.create(:banner)
    visit banners_path

    click_link("delete_banner_#{@banner.id}_from_index")
    expect(page.status_code).to eq(200)
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
      @edit_user = User.create(first_name: 'asdf', last_name: 'asdf', email: 'asdfasdf@asdf.com', password: 'asdfasdf', password_confirmation: 'asdfasdf')
      login_as(@edit_user, :scope => :user)
      @edit_banner = Banner.create(start_date: Date.today, end_date: Date.tomorrow, image: 'ghjk', location: 'ghjk', user_id: @edit_user.id)
    end

    it 'can be edited' do
      visit edit_banner_path(@edit_banner)

      fill_in 'banner[start_date]', with: Date.today
      fill_in 'banner[end_date]', with: Date.today
      fill_in 'banner[image]', with: ("Some address")
      fill_in 'banner[location]', with: ("Edited content")
      click_on "Save"
      expect(page).to have_content("Edited content")
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_authorized_user, :scope => :user)

      visit edit_banner_path(@edit_banner)
      expect(current.path).to eq(root_path)
    end
  end
end