# frozen_string_literal: true

module Order
  module Entities
    class OrderItem < ApplicationEntity

      attribute :order_id, Types::Integer.optional.meta(omittable: true)
      attribute :product_id, Types::Integer
      attribute :quantity, Types::Integer

    end
  end
end
