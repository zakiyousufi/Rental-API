require 'rails_helper'

RSpec.describe Room, type: :model do
  user = User.create(f_name: 'Tom')
  subject do
    Room.new(user:,
             name: 'Luxury',
             beds: 2,
             price: 10.99,
             description: 'Its a wonderful suite',
             image: 'https://cdn.dribbble.com/users/9685/screenshots/997495/avatarzzz.gif',
             city: 'Islamabad')
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid when name is an empty string' do
    subject.name = ''
    expect(subject).to be_invalid
  end

  it 'is not valid when name is not a string' do
    subject.name = 56
    expect(subject).to be_invalid
  end

  it 'is valid when name is a string' do
    expect(subject).to be_valid
  end

  it 'is not valid without a user' do
    subject.user = nil
    expect(subject).to be_invalid
  end

  it 'is not valid when beds is a string' do
    subject.beds = 'two'
    expect(subject).to be_invalid
  end

  it 'is not valid when price is not a decimal' do
    subject.price = 'Fourty three'
    expect(subject).to be_invalid
  end

  it 'is not valid when description is empty' do
    subject.description = ''
    expect(subject).to be_invalid
  end

  it 'is not valid when the image is empty' do
    subject.description = ''
    expect(subject).to be_invalid
  end

  it 'is not valid when the city is empty' do
    subject.city = ''
    expect(subject).to be_invalid
  end

  it 'is not valid without an image' do
    subject.image = nil
    expect(subject).to be_invalid
  end
end
