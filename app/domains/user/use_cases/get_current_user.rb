# frozen_string_literal: true

module User
  module UseCases
    class GetCurrentUser

      extend Dry::Initializer
      include Dry::Monads[:result, :maybe]
      include Dry::Monads::Do.for(:call)

      param :repository

      def call(token)
        email = yield(decode_token(token))
        user = yield(fetch_user(email['email']))

        Success(user)
      end

      private

      def decode_token(token)
        Jwt.new.decode(token)
      end

      def fetch_user(email)
        repository.find_by_email(email).to_result(:user_not_found)
      end

    end
  end
end
