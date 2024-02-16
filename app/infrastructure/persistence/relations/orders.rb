# frozen_string_literal: true

module Persistence
  module Relations
    class Orders < ROM::Relation[:sql]

      schema(:orders, infer: true) do
        associations do
          belongs_to :user
          has_many :order_items
        end
      end

      def with_items
        combine(:order_items)
      end

    end
  end
end
