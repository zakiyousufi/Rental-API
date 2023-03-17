require 'rails_helper'

RSpec.describe 'Api::V1::Rooms', type: :request do
  describe 'GET /api/v1/rooms' do
    it 'works!' do
      get api_v1_rooms_path
      expect(response).to have_http_status(200)
    end
  end
end
