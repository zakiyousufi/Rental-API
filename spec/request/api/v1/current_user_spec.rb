require 'swagger_helper'

RSpec.describe 'api/v1/current_user', type: :request do
  path '/signup' do
    post 'Creates a user account to generate a token' do
      tags 'User Authentication'
      consumes 'application/json'
      security [Bearer: []]
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              f_name: { type: :string },
              avatar: { type: :string },
              password: { type: :string },
              username: { type: :string },
              email: { type: :string }
            }
          }
        },
        required: %w[name email password]
      }
      response '201', 'user created' do
        run_test!
      end
    end
  end

  path '/login' do
    post 'You need to sign in so the servers can autenticate you' do
      tags 'User Authentication'
      consumes 'application/json'
      security [Bearer: []]
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: %w[email password]
      }

      response '200', 'User logged in successfully' do
        run_test!
      end

      response '401', 'Logged in failure' do
        let(:user) { 'invalid' }
        run_test!
      end
    end
  end
end
