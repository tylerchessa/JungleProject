require 'rails_helper'
require 'user.rb'

RSpec.describe User, type: :model do
  describe "Validations" do
    let(:user){User.new(first_name: "tyler", last_name: "chessa", email: "tylerchessa@gmail.com", password: "password", password_confirmation: "password")}
      it "is not valid without a password" do
        user.password = nil
        expect(user).to_not be_valid
        user.save
        expect(user.errors.full_messages).to include("Password can't be blank")
      end 
      it "is not valid without a password confirmation" do
        user.password_confirmation = nil
        expect(user).to_not be_valid
        user.save
        expect(user.errors.full_messages).to include("Password confirmation can't be blank")
      end 
      it "is not valid when the password and password confirmation do not match" do
        user.password_confirmation = "pass"
        expect(user).to_not be_valid
        user.save
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "must not match any email in the file with the case being insensitive" do
        user.save
        user2 = User.new(first_name: "tyrone", last_name: "charlston", email: "tylerCHESSA@gmail.com", password: "password", password_confirmation: "password")
      expect(user2).to_not be_valid
      expect(user2.errors.full_messages).to include("Email has already been taken")
      end
      it "is not valid without a first name" do
        user.first_name = nil
        expect(user).to_not be_valid
        user.save
        expect(user.errors.full_messages).to include("First name can't be blank")
      end
      it "is not valid without a last name" do
        user.last_name = nil
        expect(user).to_not be_valid
        user.save
        expect(user.errors.full_messages).to include("Last name can't be blank")
      end
      it "is not valid when password length < 6 characters" do
        user.password = "pass"
        user.password_confirmation = "pass"
        expect(user).to_not be_valid
        user.save
        expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
  end
    describe '.authenticate_with_credentials' do
      let(:user){User.new(first_name: "tyler", last_name: "chessa", email: "tylerchessa@gmail.com", password: "password", password_confirmation: "password")}
      it "is not valid if it is not authenticate" do
        user1 = User.authenticate_with_credentials("notarealuser@gmail.com", "password")
        expect(user1).to be_nil
      end
      it "allows for case to be different for email" do
        user.save
        user1 = User.authenticate_with_credentials("TYLERCHESSA@gmail.com", "password")
        expect(user1).to eq(user)
      end
      it "gets rid of leading and trailing white space for email" do
        user.save
        user1 = User.authenticate_with_credentials("  tylerchessa@gmail.com  ", "password")
        expect(user1).to eq(user)
      end
  end
end