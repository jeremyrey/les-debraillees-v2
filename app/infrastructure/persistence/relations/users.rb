# frozen_string_literal: true

module Persistence
  module Relations
    class Users < ROM::Relation[:sql]

      schema(:users, infer: true)

      def by_email(email)
        where(email: email).one
      end

    end
  end
end
