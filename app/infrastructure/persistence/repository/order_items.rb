# frozen_string_literal: true

module Persistence
  module Repository
    class OrderItems < ROM::Repository[:order_items]

      commands :create, update: :by_pk, delete: :by_pk, use: :timestamps,
                        plugins_options: { timestamps: { timestamps: %i[created_at updated_at] } }
      struct_namespace Product::Entities

    end
  end
end
