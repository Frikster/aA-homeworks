require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:test_user) { User.new(email: "steph@stef.com", password: "bloopey")}

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }

  describe "#is_password?" do
    it "correctly checks password against password in db" do
      expect(test_user.is_password?("bloopey")).to be true
      expect(test_user.is_password?("bloop")).to be false
    end
  end

  describe "#reset_session_token!" do
    it "resets the session token" do
      before_session_token = test_user.session_token
      test_user.reset_session_token!
      expect(test_user.session_token).not_to eq(before_session_token)
    end

    it "returns the session token" do
      expect(test_user.reset_session_token!).to eq(test_user.session_token)
    end
  end

  describe "::find_by_credentials" do
    before { test_user.save! }

    it "finds the user by credentials (duh)" do
      expect(User.find_by_credentials("steph@stef.com", "bloopey")).to eq(test_user)
    end

    it "returns nil if credentials don't match anyone in db" do
      expect(User.find_by_credentials("stef@stef.com", "bloopey")).to eq(nil)
      expect(User.find_by_credentials("steph@stef.com", "bloop")).to eq(nil)
      expect(User.find_by_credentials("stef@stef.com", "bloop")).to eq(nil)
    end
  end

end
