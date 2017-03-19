require 'rails_helper'

describe 'navigate' do
  before do
    @admin_user = FactoryGirl.create(:admin_user)
    login_as(@admin_user, :scope => :user)
  end

  describe 'edit' do
    before do
      @banner = FactoryGirl.create(:banner)
      visit edit_banner_path(@banner)
    end

    it 'has a status that can be edited on the form by an admin' do
      choose('banner_status_assigned')
      click_on "Save"

      expect(@banner.reload.status).to eq('assigned')
    end

    it 'it cannot be edited by a non admin' do
      logout(:user)
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)

      visit edit_banner_path(@banner)

      expect(page).to_not have_content('Assigned')
    end

    it 'should not be editable by the banner created if status is approved' do
      logout(:user)
      user = FactoryGirl.create(:user)
      login_as(user, :scope => :user)

      @banner.update(user_id: user.id, status: 'approved')

      visit edit_banner_path(@banner)

      expect(current_path).to eq(root_path)
    end
  end
end