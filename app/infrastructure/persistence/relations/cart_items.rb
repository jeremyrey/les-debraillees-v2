# frozen_string_literal: true

module Persistence
  module Relations
    class CartItems < ROM::Relation[:sql]

      schema(:cart_items, infer: true) do
        associations do
          belongs_to :product
          belongs_to :user
        end
      end

    end
  end
end
