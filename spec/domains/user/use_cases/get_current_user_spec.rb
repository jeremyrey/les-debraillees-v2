# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
require 'jwt'

describe User::UseCases::GetCurrentUser do
  subject(:use_case) { described_class.new(user_repo) }

  let(:token) { Jwt.new.encode({ email: 'rey.jeremy@hotmail.fr' }).value! }
  let(:user) do
    User::Entities::User.new(
      {
        first_name: 'J',
        last_name: 'R',
        email: 'rey.jeremy@hotmail.fr',
        password_digest: 'somedigest',
      }
    )
  end
  let(:user_repo) { instance_double('UserRepo') }

  describe '#call' do
    it 'returns the current user' do
      allow(user_repo).to receive(:find_by_email).and_return(Dry::Monads::Maybe(user))
      expect(user_repo).to receive(:find_by_email).with('rey.jeremy@hotmail.fr')
      result = use_case.call(token)
      expect(result).to be_success
    end

    it 'fails to return the current user' do
      allow(user_repo).to receive(:find_by_email).and_return(Dry::Monads::Maybe(nil))
      expect(user_repo).to receive(:find_by_email).with('rey.jeremy@hotmail.fr')
      result = use_case.call(token)
      expect(result).to be_failure
      expect(result.failure).to eq(:user_not_found)
    end
  end
end
