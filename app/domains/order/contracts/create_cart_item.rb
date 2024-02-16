# frozen_string_literal: true

module Order
  module Contracts
    class CreateCartItem < ApplicationContract

      params do
        required(:product_id).value(:integer)
        required(:user_id).value(:integer)
        required(:quantity).value(:integer)
      end

      rule(:quantity) do
        key.failure('must be greater than 0') if value <= 0
      end

    end
  end
end
