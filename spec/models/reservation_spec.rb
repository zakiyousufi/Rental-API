require 'rails_helper'

RSpec.describe Reservation, type: :model do
  user = User.create(f_name: 'Korra', email: 'ddd@gmail.com', password: 123_456)
  room = Room.new(user:,
                  name: 'Luxury',
                  beds: 2,
                  price: 10.99,
                  description: 'Its a wonderful suite',
                  image: 'https://cdn.dribbble.com/users/9685/screenshots/997495/avatarzzz.gif',
                  city: 'Islamabad')

  subject { Reservation.new(from_date: '06/05/2023', to_date: '09/12/2023', number_of_persons: 6, user:, room:) }

  it 'is not valid without a from_date' do
    subject.from_date = nil
    subject.save
    expect(subject).to_not be_valid
  end

  it 'is not valid without to_date' do
    subject.to_date = nil
    subject.save
    expect(subject).to be_invalid
  end

  it 'is not valid when number of persons is less than zero' do
    subject.number_of_persons = 0
    subject.save
    expect(subject).to be_invalid
  end

  it 'dates are in right format' do
    subject.to_date = 'One week'
    subject.save
    expect(subject).to be_invalid
  end
end
