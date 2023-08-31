require 'rails_helper'

RSpec.describe 'Group show', type: :system do
  include Devise::Test::IntegrationHelpers

  before do
    @user = User.create(name: 'muneeb', email: 'muneeb@gmail.com', password: '123456')
    login_as(@user, scope: :user)

    @group = Group.create(name: 'Mcdonalds', icon: 'https://static.vecteezy.com/system/resources/previews/020/190/610/original/mcdonalds-logo-mcdonald-icon-free-free-vector.jpg', user: @user)

    @trade = Trade.create(name: 'Burger', amount: '100', user: @user, group: @group)

  end

  describe 'GET index' do
    it 'displays  transaction information ' do
      visit user_group_path(user_id: @user.id, id: @group.id)

      expect(page).to have_css('img[src="https://static.vecteezy.com/system/resources/previews/020/190/610/original/mcdonalds-logo-mcdonald-icon-free-free-vector.jpg"]')
      expect(page).to have_content(@trade.name)
    end

    it 'displays "Add new group" link' do
      visit new_user_group_trade_path(user_id: @user.id, group_id: @group.id)
      expect(page).to have_text('Create')
    end

    it 'displays total amount ' do
      visit user_group_path(user_id: @user.id, id: @group.id)
      expect(page).to have_text('$ 100')
    end

    it 'displays amount o transaction' do
        visit user_groups_path(user_id: @user.id, id: @group.id)
        expect(page).to have_text('$ 100')
      end
  end
end