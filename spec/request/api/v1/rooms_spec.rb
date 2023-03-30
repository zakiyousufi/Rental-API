require 'swagger_helper'

RSpec.describe 'api/v1/rooms', type: :request do
  path '/api/v1/rooms' do
    get 'List all available rooms' do
      tags 'Room'
      produces 'application/json'
      security [Bearer: []]
      response '200', 'Rooms Successfully fetched' do
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

  path '/api/v1/rooms' do
    post 'Create a room' do
      tags 'Room'
      consumes 'application/json'
      security [Bearer: []]
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          room: {
            type: :object,
            properties: {
              name: { type: :string },
              beds: { type: :number },
              price: { type: :number },
              description: { type: :string },
              image: { type: :string },
              city: { type: :string }
            }
          }
        },
        required: %w[name beds price image city]
      }
      response '201', 'room created' do
        after do |example|
          example.metadata[:response][:content] = { 'application/json' => {
            example: JSON.parse(response.body, symbolize_names: true)
          } }
        end
        run_test!
      end
    end
  end

  path '/api/v1/rooms/{id}' do
    get('show room') do
      tags 'Room'
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

  path '/api/v1/rooms/{id}' do
    delete('delete room') do
      tags 'Room'
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
end
