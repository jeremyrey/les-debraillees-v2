# frozen_string_literal: true

require 'bcrypt'

module User
  module UseCases
    class AuthenticateUser

      extend Dry::Initializer
      include Dry::Monads[:result]
      include Dry::Monads::Do.for(:call)

      param :repository

      def call(session_input)
        user = yield(fetch_user(session_input[:email]))
        yield(check_password(user, session_input[:password]))

        user.jwt_token
      end

      private

      def fetch_user(email)
        repository.find_by_email(email).to_result(:user_not_found)
      end

      def check_password(user, input_password)
        return Failure(:unauthenticated) unless user.password_match?(input_password)

        Success()
      end

    end
  end
end
