require 'rails_helper'

RSpec.describe 'Reservations', type: :request do
  describe 'GET /index' do
    before(:example) { get '/api/v1/reservations' } # get(:index)

    it 'connection is well established' do
      User.create(f_name: 'Korra', email: 'ddd@gmail.com', password: 123_456)
      expect(response).to have_http_status(:ok)
    end
  end
end
