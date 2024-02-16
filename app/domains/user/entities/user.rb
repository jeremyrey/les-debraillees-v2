# frozen_string_literal: true

require 'bcrypt'

module User
  module Entities
    class User < ApplicationEntity

      attribute :first_name, Types::String
      attribute :last_name, Types::String
      attribute :phone, Types::String.optional.meta(omittable: true)
      attribute :password_digest, Types::String
      attribute :email, Types::String

      def fullname
        "#{first_name}: #{last_name}"
      end

      def password_match?(password_to_check)
        BCrypt::Password.new(password_digest) == password_to_check
      end

      def jwt_token
        Jwt.new.encode({ email: email })
      end

    end
  end
end
