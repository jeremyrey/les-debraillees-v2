# frozen_string_literal: true

module Persistence
  module Repository
    class Products < ROM::Repository[:products]

      include Dry::Monads[:maybe]

      commands :create, update: :by_pk, delete: :by_pk, use: :timestamps,
                        plugins_options: { timestamps: { timestamps: %i[created_at updated_at] } }
      struct_namespace Product::Entities

      def all
        products.to_a
      end

      def find_by_id(id)
        Maybe(products.find_by_id(id))
      end

      delegate :filter_by_categories_and_brands, to: :products

      delegate :filter_by_categories, to: :products

      delegate :filter_by_brands, to: :products

    end
  end
end
