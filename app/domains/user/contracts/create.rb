# frozen_string_literal: true

module User
  module Contracts
    class Create < ApplicationContract

      EMAIL_VALIDATION_REGEXP = /\A[\w+\-.]+@[a-z\d-]+(\.[a-z\d-]+)*\.[a-z]+\z/i.freeze

      params do
        required(:first_name).value(:string)
        required(:last_name).value(:string)
        required(:email).value(:string)
        optional(:phone).value(:string)
        required(:password).value(:string)
        required(:password_confirmation).value(:string)
      end

      rule(:email) do
        key.failure('has invalid format') unless EMAIL_VALIDATION_REGEXP.match?(value)
      end

      rule(:password, :password_confirmation) do
        key.failure('must be equals to password_confirmation') if values[:password] != values[:password_confirmation]
      end

      rule(:password) do
        key.failure('password must be at least 8 characters') if value.length < 8
      end

    end
  end
end
