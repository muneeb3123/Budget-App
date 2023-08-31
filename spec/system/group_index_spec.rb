require 'rails_helper'

RSpec.describe 'Groups', type: :system do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'muneeb', email: 'muneeb@gmail.com', password: '123456')
    login_as(@user, scope: :user)
    @group = Group.create(name: 'School', icon: 'https://img.freepik.com/free-vector/gradient-high-school-logo-design_23-2149626932.jpg', user: @user)
  end

  describe 'GET index' do
    it 'displays  categories information ' do
      visit user_groups_path(user_id: @user.id)

      expect(page).to have_css('img[src="https://img.freepik.com/free-vector/gradient-high-school-logo-design_23-2149626932.jpg"]')
      expect(page).to have_content(@group.name)
    end

    it 'displays "Add new group" link' do
      visit user_groups_path(user_id: @user.id)
      expect(page).to have_text('Add new')
    end

    it 'displays "create" link to create new category' do
        visit new_user_group_path(user_id: @user.id)
        expect(page).to have_text('create')
      end

    it 'displays total amount ' do
      visit user_groups_path(user_id: @user.id)
      expect(page).to have_text('$ 0')
    end
  end
end