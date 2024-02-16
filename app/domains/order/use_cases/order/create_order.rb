# frozen_string_literal: true

module Order
  module UseCases
    module Order
      class CreateOrder

        extend Dry::Initializer
        include Dry::Monads[:result, :maybe]
        include Dry::Monads::Do.for(:call)

        param :repository

        def call(user_id)
          # Create order with order items
          # Call StripeService to create payment_intent
          Success()
        end

      end
    end
  end
end
