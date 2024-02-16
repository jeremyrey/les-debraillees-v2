# frozen_string_literal: true

module Delivery
  module Contracts
    class GetDeliveryPlace < ApplicationContract

      params do
        required(:id).filled(:string)
      end

    end
  end
end
