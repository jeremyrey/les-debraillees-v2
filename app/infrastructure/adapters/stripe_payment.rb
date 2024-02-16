# frozen_string_literal: true

module Adapters
  class StripePayment

    extend Dry::Initializer

    def create_user(user)
      Stripe::Customer.create(
        {
          name: user.fullname,
          email: user.email,
        }
      )
    end

    def create_subscription; end

    def create_payment_intent(order)
      Stripe::PaymentIntent.create(
        {
          amount: order.total * 100,
          currency: 'eur',
          automatic_payment_methods: { enabled: true },
        }
      )
    end

  end
end
