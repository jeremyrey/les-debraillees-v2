# frozen_string_literal: true

class UsersController < SecureController

  include Dry::Monads[:result, :maybe]
  include LesDebrailleesV2::Deps[repo: :user_repo]
  skip_before_action :authenticate_user, only: [:create]

  def show
    render(json: @current_user)
  end

  def create
    result =
      Maybe(params)
        .fmap(&:to_enum)
        .fmap(&:to_h)
        .bind { User::Contracts::Create.new.call(_1).to_monad }
        .bind { User::UseCases::CreateUser.new(repo).call(_1.to_h) }

    case result
    in Success(value)
      render(json: value, status: :created)
    in Failure(Dry::Validation::Result)
      render(json: result.failure.errors.to_h, status: :bad_request)
    in Failure(:unable_to_create_user)
      render(json: result.failure, status: :bad_request)
    end
  end

end
