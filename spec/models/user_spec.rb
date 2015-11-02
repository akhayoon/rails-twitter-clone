# spec/models/user.rb
require "rails_helper"  # this

describe User do
  let(:user) { FactoryGirl.create(:user) }


  it "has a valid factory" do
    expect(user).to be_valid
  end
  
  it "is invalid without a name" do
   expect(FactoryGirl.build(:user, name: nil)).not_to be_valid
  end
  it "is invalid without an email" do
    expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
  end
  it "returns a password digest as a string" do
    expect(user.password_digest).not_to eq("password")
  end
  it "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. 
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      user = FactoryGirl.build(:user, email: invalid_address)
      expect(user).not_to be_valid
    end
  end
  it "email addresses should be unique" do
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    user.save
    expect(duplicate_user).not_to be_valid
  end
end