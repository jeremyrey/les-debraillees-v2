# frozen_string_literal: true

module Persistence
  module Relations
    class OrderItems < ROM::Relation[:sql]

      schema(:order_items, infer: true) do
        associations do
          belongs_to :product
          belongs_to :order
        end
      end

    end
  end
end
