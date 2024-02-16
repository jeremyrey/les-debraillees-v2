# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe User::Contracts::Create do
  subject(:contract) { described_class.new }

  describe '#call' do
    context 'when validating email' do
      let(:input) do
        {
          first_name: 'FirstName',
          last_name: 'LastName',
          password_confirmation: 'validpassword',
          password: 'validpassword',
        }
      end

      it 'fails when not valid email' do
        result = contract.call(input.merge({ email: 'not_valid' }))
        expect(result.success?).to be(false)
      end

      it 'is success when valid email' do
        result = contract.call(input.merge({ email: 'valid@email.fr' }))
        expect(result.success?).to be(true)
      end
    end

    context 'when validating password' do
      let(:input) do
        {
          first_name: 'FirstName',
          last_name: 'LastName',
          email: 'valid@email.fr',
        }
      end

      it 'fails when min length is not met' do
        result = contract.call(input.merge({ password: 'invalid', password_confirmation: 'invalid' }))
        expect(result.success?).to be(false)
      end

      it 'fails when password and confirmation not equals' do
        result = contract.call(input.merge({ password: 'validpassword', password_confirmation: 'invalidpassword' }))
        expect(result.success?).to be(false)
      end

      it 'is success when provided' do
        result = contract.call(input.merge({ password: 'validpassword', password_confirmation: 'validpassword' }))
        expect(result.success?).to be(true)
      end
    end
  end
end
