# frozen_string_literal: true

module Persistence
  module Repository
    class ProductCategories < ROM::Repository[:product_categories]

      commands :create, update: :by_pk, delete: :by_pk, use: :timestamps,
                        plugins_options: { timestamps: { timestamps: %i[created_at updated_at] } }
      struct_namespace Product::Entities

      def all
        product_categories.to_a
      end

    end
  end
end
