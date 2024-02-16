# frozen_string_literal: true

module Persistence
  module Relations
    class Products < ROM::Relation[:sql]

      include Dry::Monads[:maybe]

      schema(:products, infer: true) do
        associations do
          belongs_to :brand
          has_many :product_categories, through: :products_product_categories
          has_many :products_product_categories
          has_many :orders
          has_many :cart_items
        end
      end

      def find_by_id(id)
        by_pk(id).one
      end

      def filter_by_categories_and_brands(category_ids, brand_ids)
        distinct(:id).join(:products_product_categories) do |products:, products_product_categories:|
          products_product_categories[:product_id].is(products[:id]) &
            (
              products[:brand_id].in(*brand_ids) |
              products_product_categories[:product_category_id].in(*category_ids)
            )
        end.to_a
      end

      def filter_by_categories(category_ids)
        distinct(:id)
          .inner_join(:products_product_categories, product_id: :id, product_category_id: category_ids)
      end

      def filter_by_brands(brand_ids)
        where(brand_id: brand_ids)
      end

    end
  end
end
