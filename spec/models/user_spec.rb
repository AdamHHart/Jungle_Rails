require 'rails_helper'

RSpec.describe User, type: :model do

  
  describe 'Validations' do

    it ("should create and save a new user if all validations are met") do
      @user = User.new(first_name: "Adam", last_name: "Hart", email: "Example@example.com", password: "Randyyyy", password_confirmation: "Randyyyy")
      @user.valid?
      expect(@user.errors).not_to include("anything")
    end

    it ("should have a password and password_confirmation fields") do
      @user = User.new(first_name: "Adam", last_name: "Hart", email: "Example@example.com", password: "Randyyyy", password_confirmation: "Rickyyyy")
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn\'t match Password")
    end

    # it ("should have matching passwords")
    it ("should have matching password and password_confirmation fields") do
      @user = User.new(
        first_name: "Adam", last_name: "Hart", email: "Example@example.com", password: "Randyyyy", password_confirmation: "Rickyyyy")
      @user.valid?
      expect(@user.password_confirmation == @user.password)
      expect(@user.errors[:password_confirmation]).to include("doesn\'t match Password")
     end

    it ("should have unique emails, case not sensitive") do
      @user1 = User.new(first_name: "Adam", last_name: "Hart", email: "adam@example.com", password: "Randyyyy", password_confirmation: "Randyyyy")
      @user1.save!
      @user2 = User.new(first_name: "Charlie", last_name: "Hart", email: "adam@example.com", password: "Randyyyy", password_confirmation: "Randyyyy")
      # expect(@user2.errors[:email]).to include("already been taken")
      expect(@user2).not_to be_valid
    end

    # it ("should have email, first name, and last name")
    it ("should create and save a new user if all validations are met") do
      @user = User.new(first_name: "Adam", last_name: "Hart", email: "Example@example.com", password: "Randy", password_confirmation: "Randy")
      @user.valid?
      expect(@user.errors).not_to include("anything")
      
    end

    it ("should have a password length > 7 characters") do
      @user = User.new(
        first_name: "Adam", last_name: "Hart", email: "Example@example.com", password: "Randy", password_confirmation: "Randy")
      @user.valid?
      # expect(@user.errors[:password]).to include("too short")
      expect(@user).not_to be_valid
    end


    # it ("should be valid if there are spaces before or after the email")

    
  end

  describe '.authenticate_with_credentials' do

    it ("should take in email address and password as arguments in the login form") do
      @user = User.new(first_name: "Adam", last_name: "Hart", email: "adam@example.com", password: "Randyyyy", password_confirmation: "Randy")
      @authenticated_user = User.authenticate_with_credentials("", "Randyyyy")
      expect(@authenticated_user).not_to eq(@user)
    end

    # it ("should return an instance of the user if authenticated")
    it ("should not be case sensitive for email, all emails, to_lowercase.") do
      @user = User.new(first_name: "Adam", last_name: "Hart", email: "adam@example.com", password: "Randyyyy", password_confirmation: "Randyyyy")
      @user.save!
      @authenticated_user = User.authenticate_with_credentials("adam@example.com", "Randyyyy")
      expect(@authenticated_user).to eq(@user)
    end

    it ("should not be case sensitive for email, all emails, to_lowercase.") do
      @user = User.new(first_name: "Adam", last_name: "Hart", email: "adam@example.com", password: "Randyyyy", password_confirmation: "Randyyyy")
      @user.save!
      @authenticated_user = User.authenticate_with_credentials("ADAM@example.com", "Randyyyy")
      expect(@authenticated_user).to eq(@user)
    end
  end

end