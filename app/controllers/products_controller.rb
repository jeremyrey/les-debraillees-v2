# frozen_string_literal: true

class ProductsController < ApplicationController

  include LesDebrailleesV2::Deps[repo: :product_repo]
  include Dry::Monads[:result, :maybe]

  def index
    result =
      Maybe(params)
        .maybe(&:to_enum)
        .maybe(&:to_h)
        .bind { Product::Contracts::List.new.call(_1).to_monad }
        .bind { Product::UseCases::ListProducts.new(repo).call(_1.to_h) }

    case result
    in Success[*value]
      render(json: value)
    in Failure(Dry::Validation::Result)
      render(json: result.failure.errors.to_h, status: :bad_request)
    end
  end

end
