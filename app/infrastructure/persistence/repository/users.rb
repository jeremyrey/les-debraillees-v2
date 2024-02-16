# frozen_string_literal: true

module Persistence
  module Repository
    class Users < ROM::Repository[:users]

      include Dry::Monads[:maybe]

      commands :create, update: :by_pk, delete: :by_pk, use: :timestamps,
                        plugins_options: { timestamps: { timestamps: %i[created_at updated_at] } }
      struct_namespace User::Entities

      def find_by_email(email)
        Maybe(users.by_email(email))
      end

    end
  end
end
