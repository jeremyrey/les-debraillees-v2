# frozen_string_literal: true

module User
  module Contracts
    class CreateSession < ApplicationContract

      EMAIL_VALIDATION_REGEXP = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i.freeze

      params do
        required(:email).value(:string)
        required(:password).value(:string)
      end

      rule(:email) do
        key.failure('has invalid format') unless EMAIL_VALIDATION_REGEXP.match?(value)
      end

    end
  end
end
