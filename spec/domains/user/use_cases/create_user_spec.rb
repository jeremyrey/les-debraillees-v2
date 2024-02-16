# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
require 'jwt'

describe User::UseCases::CreateUser do
  subject(:use_case) { described_class.new(user_repo) }

  let(:input) do
    {
      first_name: 'FirstName',
      last_name: 'LastName',
      email: 'valid@email.fr',
      password: 'validpassworddigest',
    }
  end
  let(:user) { User::Entities::User.new(input.merge({ password_digest: 'somedigest' })) }
  let(:user_repo) { instance_double('UserRepo') }

  describe '#call' do
    it 'returns a JWT token' do
      allow(user_repo).to receive(:create).and_return(user)
      result = use_case.call(input)
      expect(result).to be_success
    end
  end
end
