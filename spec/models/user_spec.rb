require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(
        name: 'John Doe',
        email: 'john@example.com',
        password: 'password123'
      )
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(name: nil)
      expect(user).not_to be_valid
    end

    it 'is not valid without an email' do
      user = User.new(email: nil)
      expect(user).not_to be_valid
    end

    it 'is not valid with an invalid email format' do
      user = User.new(email: 'invalid_email')
      expect(user).not_to be_valid
    end

    it 'is not valid without a password' do
      user = User.new(password: nil)
      expect(user).not_to be_valid
    end
  end
end
