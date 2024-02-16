# frozen_string_literal: true

module Product
  module Contracts
    class List < ApplicationContract

      params do
        optional(:categories).value(:string)
        optional(:brands).value(:string)
      end

    end
  end
end
