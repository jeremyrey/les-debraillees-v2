# frozen_string_literal: true

module Persistence
  module Repository
    class ProductsProductCategories < ROM::Repository[:products_product_categories]

      commands :create, update: :by_pk, delete: :by_pk, use: :timestamps,
                        plugins_options: { timestamps: { timestamps: %i[created_at updated_at] } }
      struct_namespace Product::Entities

    end
  end
end
