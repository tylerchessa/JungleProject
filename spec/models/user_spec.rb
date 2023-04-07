# require 'rails_helper'

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
end