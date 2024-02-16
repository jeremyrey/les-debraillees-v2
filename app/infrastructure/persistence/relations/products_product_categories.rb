# frozen_string_literal: true

module Persistence
  module Relations
    class ProductsProductCategories < ROM::Relation[:sql]

      schema(:products_product_categories, infer: true) do
        associations do
          belongs_to :product
          belongs_to :product_category
        end
      end

    end
  end
end
