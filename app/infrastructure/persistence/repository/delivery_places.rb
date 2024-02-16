# frozen_string_literal: true

module Persistence
  module Repository
    class DeliveryPlaces < ROM::Repository[:delivery_places]

      commands :create, update: :by_pk, delete: :by_pk, use: :timestamps,
                        plugins_options: { timestamps: { timestamps: %i[created_at updated_at] } }
      struct_namespace Delivery::Entities

      def find_by_id!(id)
        delivery_places.by_pk(id).one
      end

      def all
        delivery_places.to_a
      end

    end
  end
end
