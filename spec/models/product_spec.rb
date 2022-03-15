require 'rails_helper'

# class User; end

# describe User do
#   subject { described_class }
#   it { is_expected.to eq(User) }
# end

RSpec.describe Product, type: :model do
  
  category = Category.find_or_create_by!(:name => "electronics")

  subject {described_class.new(name:  "speaker", price:  100, quantity:  2, category: category)}

  describe 'Validations' do

    it 'has valid attributes' do
      expect(subject).to be_valid()
    end

    it 'ensures that the product has a name' do
          subject.name = ""
        expect(subject).to_not be_valid   
    end

    it 'ensures that the product has a price' do
        subject.price = 200
        expect(subject.price).to eq(200)
    end

    it 'ensures that the product has a quantity' do
        expect(subject.quantity).to eql(2)
    end

    it 'ensures that the product has a category' do
        expect(subject).to be_valid
    end
  
  end
end
