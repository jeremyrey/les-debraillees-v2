# frozen_string_literal: true

module Product
  module UseCases
    class ListProducts

      extend Dry::Initializer
      include Dry::Monads[:result]
      include Dry::Monads::Do.for(:call)

      param :repository

      def call(query_filters)
        return Success(repository.all) if !query_filters[:categories].present? && !query_filters[:brands].present?

        result =
          if query_filters[:categories].present? && !query_filters[:brands].present?
            repository.filter_by_categories(query_filters[:categories].split(',').map(&:to_i))
          elsif !query_filters[:categories].present? && query_filters[:brands].present?
            repository.filter_by_brands(query_filters[:brands].split(',').map(&:to_i))
          elsif query_filters[:categories].present? && query_filters[:brands].present?
            repository.filter_by_categories_and_brands(query_filters[:categories].split(',').map(&:to_i), query_filters[:brands].split(',').map(&:to_i))
          end

        Success(result)
      end

    end
  end
end
