# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:input) do
    {
      first_name: 'J',
      last_name: 'R',
      email: 'email@ok.fr',
      password: 'validpassword',
      password_confirmation: 'validpassword',
    }
  end

  context 'with Post /User' do
    it 'returns the token for the created User' do
      post '/users', params: input
      expect(response.status).to eq(201)
      expect(Jwt.new.decode(response.body).value!['email']).to eq(input[:email])
    end
  end
end
