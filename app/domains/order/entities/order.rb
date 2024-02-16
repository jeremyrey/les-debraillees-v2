# frozen_string_literal: true

module Order
  module Entities
    class Order < ApplicationEntity

      attribute :user_id, Types::Integer
      attribute :total, Types::Integer
      attribute :order_items, Types::Array.of(OrderItem)

    end
  end
end
