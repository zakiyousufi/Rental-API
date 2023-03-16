require 'swagger_helper'

RSpec.describe 'api/v1/reservations', type: :request do
  path '/api/v1/reservations' do
    get('list reservations') do
      tags 'Reservation'
      produces 'application/json'
      security [Bearer: []]
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    delete('delete reservation') do
      tags 'Reservation'
      produces 'application/json'
      security [Bearer: []]
      parameter name: 'id', in: :path, type: :string, description: 'id'
      response(200, 'successful') do
        let(:id) { '123' }
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/rooms/{room_id}/reservations' do
    post('create reservation') do
      tags 'Reservation'
      consumes 'application/json'
      security [Bearer: []]
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          reservation: {
            type: :object,
            properties: {
              from_date: { type: :string, format: :date },
              to_date: { type: :string, format: :date },
              number_of_persons: { type: :number }
            }
          }
        },
        required: %w[from_date to_date number_of_persons]
      }
      parameter name: 'room_id', in: :path, type: :string, description: 'room_id'
      response(200, 'successful') do
        let(:room_id) { '123' }
        after do |example|
          example.metadata[:response][:content] = { 'application/json' => {
            example: JSON.parse(response.body, symbolize_names: true)
          } }
        end
        run_test!
      end
    end
  end
end
