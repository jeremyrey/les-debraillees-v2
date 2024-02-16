# frozen_string_literal: true

module Order
  module Entities
    class CartItem < ApplicationEntity

      attribute :product_id, Types::Integer
      attribute :user_id, Types::Integer
      attribute :quantity, Types::Integer

    end
  end
end
