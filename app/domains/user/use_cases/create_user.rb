# frozen_string_literal: true

require 'bcrypt'

module User
  module UseCases
    class CreateUser

      extend Dry::Initializer
      include Dry::Monads[:result, :maybe]
      include Dry::Monads::Do.for(:call)

      param :repository

      def call(user_input)
        user = yield(create_user(user_input))
        user.jwt_token
      end

      private

      def create_user(user_input)
        Maybe(
          repository.create(
            Entities::User.new(
              user_input.merge(
                {
                  password_digest: generate_user_password_digest(user_input[:password]),
                }
              )
            ).attributes
          )
        ).to_result(:unable_to_create_user)
      end

      def generate_user_password_digest(password)
        BCrypt::Password.create(password)
      end

    end
  end
end
