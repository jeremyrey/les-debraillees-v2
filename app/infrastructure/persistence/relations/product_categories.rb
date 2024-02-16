# frozen_string_literal: true

module Persistence
  module Relations
    class ProductCategories < ROM::Relation[:sql]

      schema(:product_categories, infer: true) do
        associations do
          has_many :products_product_categories
          has_many :products, through: :products_product_categories
        end
      end

      def by_code(code)
        where(code)
      end

    end
  end
end
