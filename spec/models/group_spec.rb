require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'validations' do
    let(:user) { User.new(name: 'John Doe', email: 'john@example.com', password: 'password123') }

    it 'is valid with valid attributes' do
      group = Group.new(
        name: 'Sample Group',
        icon: 'https://example.com/icon.png',
        user:
      )
      expect(group).to be_valid
    end

    it 'is not valid without a name' do
      group = Group.new(name: nil, icon: 'https://example.com/icon.png', user:)
      expect(group).not_to be_valid
    end

    it 'is not valid without an icon' do
      group = Group.new(name: 'Sample Group', icon: nil, user:)
      expect(group).not_to be_valid
    end

    it 'is not valid without a user' do
      group = Group.new(name: 'Sample Group', icon: 'https://example.com/icon.png', user: nil)
      expect(group).not_to be_valid
    end
  end
end
