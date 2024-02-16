# frozen_string_literal: true

module Persistence
  module Relations
    class DeliveryPlaces < ROM::Relation[:sql]

      schema(:delivery_places, infer: true)

    end
  end
end
