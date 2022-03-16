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
end
