# frozen_string_literal: true

class CartItemsController < SecureController

  include Dry::Monads[:result, :maybe]
  include LesDebrailleesV2::Deps[repo: :cart_item_repo]
  include LesDebrailleesV2::Deps[product_repo: :product_repo]

  def create
    result =
      Maybe(params)
        .fmap(&:to_enum)
        .fmap(&:to_h)
        .bind { Order::Contracts::CreateCartItem.new.call(_1).to_monad }
        .bind { Order::UseCases::Cart::CreateCartItem.new(repo, product_repo).call(_1.to_h) }

    case result
    in Success(value)
      render(json: value)
    in Failure(Dry::Validation::Result)
      render(json: result.failure.errors.to_h, status: :bad_request)
    in Failure(:not_enough_quantity)
      render(json: result.failure, status: :bad_request)
    in Failure(:product_not_found)
      render(json: result.failure, status: :not_found)
    in Failure(:unable_to_add_product)
      render(json: result.failure, status: :bad_request)
    end
  end

end
