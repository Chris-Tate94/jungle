require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before do
      @subject = described_class.create(first_name: "Mike", last_name: "Smith", email: "test@test1.com", password: "SubjectPass", password_confirmation: "SubjectPass")

      @subject2 = described_class.create(first_name: "Chris", last_name: "tate", email: "test@test1.com", password: "NewPassword", password_confirmation: "NewPassword")
    end

    it 'has valid attributes'do

      expect(@subject).to be_valid()
    end

    it 'has been created with a password' do
      @subject.password = "NewPassword"
      @subject.password_confirmation = "NewPassword"
      expect(@subject).to be_valid()
    end

    it 'validates if password and password_confirmation match' do
      @subject.password = "NewPassword"
      @subject.password_confirmation = "Password"
      expect(@subject).to_not be_valid()
    end

    it 'validates if password and password_confirmation match' do
      @subject.password = "NewPassword"
      @subject.password_confirmation = "NewPassword"
      expect(@subject).to be_valid()
    end

    it 'validates if password and password_confirmation to have a minimum length of 6' do
      @subject.password = "NewPassword"
      @subject.password_confirmation = "NewPassword"
      expect(@subject.password.length).to be >= 6
      expect(@subject.password_confirmation.length).to be >= 6
    end

    it 'checks if email already exists in the db' do
      expect(@subject2).to_not be_valid()
    end
  end

  describe '.authenticate_with_credentials' do

    before do
      @subject3 = described_class.create(first_name: "John", last_name: "Doe", email: "   test@test2.com  ", password: "SubjectPass", password_confirmation: "SubjectPass")

      @subject4 = described_class.create(first_name: "John", last_name: "Doe", email: "   TEST@test2.com  ", password: "SubjectPass", password_confirmation: "SubjectPass")
    end

    it 'checks to see if user is still authenticated with spaces before or after their email' do
      expect(@subject3).to be_valid()
    end

    it 'validates that the email is not case sensitive' do
      expect(@subject4).to be_valid()
    end
  end
end
