# frozen_string_literal: true

module Persistence
  module Repository
    class Brands < ROM::Repository[:brands]

      commands :create, update: :by_pk, delete: :by_pk, use: :timestamps,
                        plugins_options: { timestamps: { timestamps: %i[created_at updated_at] } }
      struct_namespace Product::Entities

      def find_by_id!(id)
        brands.by_pk(id).one
      end

      def all
        brands.to_a
      end

    end
  end
end
