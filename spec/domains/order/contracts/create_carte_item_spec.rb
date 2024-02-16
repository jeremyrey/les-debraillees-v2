# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe Order::Contracts::CreateCartItem do
  subject(:contract) { described_class.new }

  describe '#call' do
    context 'when validating product_id' do
      let(:input) { { quantity: 1, user_id: 1 } }

      it 'fails when not provided' do
        result = contract.call(input)
        expect(result.success?).to be(false)
      end

      it 'is success when provided' do
        result = contract.call(input.merge({ product_id: 1 }))
        expect(result.success?).to be(true)
      end
    end

    context 'when validating user_id' do
      let(:input) { { quantity: 1, product_id: 1 } }

      it 'fails when not provided' do
        result = contract.call(input)
        expect(result.success?).to be(false)
      end

      it 'is success when provided' do
        result = contract.call(input.merge({ user_id: 1 }))
        expect(result.success?).to be(true)
      end
    end

    context 'when validating quantity' do
      let(:input) { { product_id: 1, user_id: 1 } }

      it 'fails when not provided' do
        result = contract.call(input)
        expect(result.success?).to be(false)
      end

      it 'fails when 0' do
        result = contract.call(input.merge({ quantity: 0 }))
        expect(result.success?).to be(false)
      end

      it 'is success when provided' do
        result = contract.call(input.merge({ quantity: 1 }))
        expect(result.success?).to be(true)
      end
    end
  end
end
