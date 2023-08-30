# require 'rails_helper'

RSpec.describe Trade, type: :model do
  
  describe "validations" do
    let(:user) { User.new(name: "John Doe", email: "john@example.com", password: "password123") }
    let(:group) { Group.new(name: "Sample Group", icon: "https://example.com/icon.png", user: user) }

    it "is valid with valid attributes" do
      trade = Trade.new(
        name: "Sample Trade",
        amount: 100,
        user: user,
        group: group
      )
      expect(trade).to be_valid
    end

    it "is not valid without a name" do
      trade = Trade.new(name: nil, amount: 100, user: user, group: group)
      expect(trade).not_to be_valid
    end

    it "is not valid without an amount" do
      trade = Trade.new(name: "Sample Trade", amount: nil, user: user, group: group)
      expect(trade).not_to be_valid
    end

    it "is not valid with a non-numeric amount" do
      trade = Trade.new(name: "Sample Trade", amount: "invalid", user: user, group: group)
      expect(trade).not_to be_valid
    end

    it "is not valid with an amount less than or equal to 0" do
      trade = Trade.new(name: "Sample Trade", amount: 0, user: user, group: group)
      expect(trade).not_to be_valid
    end

    it "is not valid without a group" do
      trade = Trade.new(name: "Sample Trade", amount: 100, user: user, group: nil)
      expect(trade).not_to be_valid
    end
  end
end
