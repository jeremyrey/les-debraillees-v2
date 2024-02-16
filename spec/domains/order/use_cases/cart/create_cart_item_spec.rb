# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe Order::UseCases::Cart::CreateCartItem do
  include Dry::Monads[:result, :maybe]
  subject(:use_case) { described_class.new(repo, product_repo) }

  let(:repo) { instance_double('CartItemRepo') }
  let(:product_repo) { instance_double('ProductRepo') }
  let(:input) do
    {
      user_id: 1,
      product_id: 1,
      quantity: 2,
    }
  end
  let(:product) do
    Product::Entities::Product.new({ id: 1, name: 'Pull', quantity: quantity, description: 'Joli pull' })
  end
  let(:cart_item) do
    Order::Entities::CartItem.new(input)
  end

  describe '#call' do
    context 'when product is not found' do
      it 'fails to create cart_item' do
        allow(product_repo).to receive(:find_by_id).and_return(None())
        result = use_case.call(input)
        expect(result).to be_failure
        expect(result.failure).to eq(:product_not_found)
      end
    end

    context 'when product quantity is 0' do
      let(:quantity) { 0 }

      it 'fails to create cart_item' do
        allow(product_repo).to receive(:find_by_id).and_return(Maybe(product))
        result = use_case.call(input)
        expect(result).to be_failure
        expect(result.failure).to eq(:not_enough_quantity)
      end
    end

    context 'when product quantity is lower than cart item quantity' do
      let(:quantity) { 1 }

      it 'fails to create cart_item' do
        allow(product_repo).to receive(:find_by_id).and_return(Maybe(product))
        result = use_case.call(input)
        expect(result).to be_failure
        expect(result.failure).to eq(:not_enough_quantity)
      end
    end

    context 'when conditions are met' do
      let(:quantity) { 4 }

      it 'succeeds to create cart_item' do
        allow(product_repo).to receive(:find_by_id).and_return(Maybe(product))
        allow(repo).to receive(:create).and_return(cart_item)
        result = use_case.call(input)
        expect(result).to be_success
      end
    end
  end
end
