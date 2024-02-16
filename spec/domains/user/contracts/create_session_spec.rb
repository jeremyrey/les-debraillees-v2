# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe User::Contracts::CreateSession do
  subject(:contract) { described_class.new }

  describe '#call' do
    context 'when validating email' do
      let(:input) { { password: 'valid' } }

      it 'fails when not valid email' do
        result = contract.call(input.merge({ email: 'not_valid' }))
        expect(result.success?).to be(false)
      end

      it 'is success when valid email' do
        result = contract.call(input.merge({ email: 'valid@email.fr' }))
        expect(result.success?).to be(true)
      end

      it 'fails when not provided' do
        result = contract.call(input)
        expect(result.success?).to be(false)
      end
    end

    context 'when validating password' do
      let(:input) { { email: 'valid@email.fr' } }

      it 'fails when not provided' do
        result = contract.call(input)
        expect(result.success?).to be(false)
      end

      it 'is success when provided' do
        result = contract.call(input.merge({ password: 'valid' }))
        expect(result.success?).to be(true)
      end
    end
  end
end
