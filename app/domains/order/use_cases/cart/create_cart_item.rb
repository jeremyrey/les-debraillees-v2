# frozen_string_literal: true

module Order
  module UseCases
    module Cart
      class CreateCartItem

        extend Dry::Initializer
        include Dry::Monads[:result, :maybe]
        include Dry::Monads::Do.for(:call)

        param :repository
        param :product_repository

        def call(input)
          product = yield(fetch_product(input[:product_id]))
          yield(check_quantity(product.quantity, input[:quantity]))
          add_item(input)
        end

        private

        def fetch_product(product_id)
          product_repository.find_by_id(product_id).to_result(:product_not_found)
        end

        def check_quantity(product_quantity, cart_item_quantity)
          return Failure(:not_enough_quantity) if cart_item_quantity > product_quantity

          Success()
        end

        def add_item(cart_item_input)
          Maybe(repository.create(cart_item_input)).to_result(:unable_to_add_product)
        end

      end
    end
  end
end
