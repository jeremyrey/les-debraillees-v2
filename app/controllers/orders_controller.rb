# frozen_string_literal: true

class OrdersController < SecureController

  include Dry::Monads[:result, :maybe]
  include LesDebrailleesV2::Deps[order_repo: :order_repo]
  include LesDebrailleesV2::Deps[cart_item_repo: :cart_items_repo]

  def create
    result = Product::UseCases::ListProducts.new(repo).call(@current_user.id)

    case result
    in Success(value)
      render(json: value)
    in Failure(errors)
      render(json: result.failure.errors.to_h, status: :bad_request)
    end
  end

end
