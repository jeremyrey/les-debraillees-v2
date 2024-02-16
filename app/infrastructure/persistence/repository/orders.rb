# frozen_string_literal: true

module Persistence
  module Repository
    class Orders < ROM::Repository[:orders]

      commands :create, update: :by_pk, delete: :by_pk, use: :timestamps,
                        plugins_options: { timestamps: { timestamps: %i[created_at updated_at] } }
      struct_namespace Product::Entities

      def create_with_order_items(order)
        orders.with_items.command(:create).call(order)
      end

    end
  end
end
