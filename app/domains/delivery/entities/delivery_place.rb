# frozen_string_literal: true

module Delivery
  module Entities
    class DeliveryPlace < ApplicationEntity

      attribute :id, Types::Integer
      attribute :name, Types::String
      attribute :description, Types::String.optional

      # def self.from_relation(relation)
      #  new(id: relation[:id], name: relation[:name], description: relation[:description])
      # end

      def details
        "#{name}: #{description}"
      end

    end
  end
end
