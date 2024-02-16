# frozen_string_literal: true

require 'bcrypt'

module Product
  module Entities
    class Product < ApplicationEntity

      attribute :name, Types::String
      attribute :description, Types::String
      attribute :quantity, Types::Integer

    end
  end
end
