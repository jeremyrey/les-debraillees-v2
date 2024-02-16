# frozen_string_literal: true

module Persistence
  module Relations
    class Brands < ROM::Relation[:sql]

      schema(:brands, infer: true)

    end
  end
end
