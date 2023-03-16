require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new({first_name: "Test", last_name: "Test", email: "test@test.com", password: "123456", password_confirmation: "123456"})
  end

  describe 'Validations' do
    it "should be saved if all fields are set" do
      @user.save
      expect(@user).to be_present
    end

    it "should return error message if passwords are not matching" do
      @user.password_confirmation = "654321"
      @user.save
      expect(@user.errors.full_messages.first).to eq("Password confirmation doesn't match Password")
    end

    it "should return error message if password fields are empty" do
      @user.password = nil || @user.password_confirmation = nil
      @user.save
      expect(@user.errors.full_messages.first).to eq("Password is too short (minimum is 6 characters)")
    end

    it "should return error message if password is less than 6 characters" do
      @user.password = "123"
      @user.save
      expect(@user.errors.full_messages.first).to eq("Password is too short (minimum is 6 characters)")
    end


  end
end
