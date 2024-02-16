# frozen_string_literal: true

module Delivery
  module UseCases
    class FetchDeliveryPlace

      extend Dry::Initializer

      param :repository

      def call(id)
        repository.find_by_id!(id)
      end

    end
  end
end
