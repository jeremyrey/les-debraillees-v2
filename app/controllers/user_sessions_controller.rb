# frozen_string_literal: true

class UserSessionsController < ApplicationController

  include Dry::Monads[:result, :maybe]
  include LesDebrailleesV2::Deps[repo: :user_repo]

  def create
    result =
      Maybe(params)
        .fmap(&:to_enum)
        .fmap(&:to_h)
        .bind { User::Contracts::CreateSession.new.call(_1).to_monad }
        .bind { User::UseCases::AuthenticateUser.new(repo).call(_1.to_h) }

    case result
    in Success(value)
      render(json: value)
    in Failure(Dry::Validation::Result)
      render(json: result.failure.errors.to_h, status: :bad_request)
    in Failure(:unauthenticated)
      render(json: result.failure, status: :unauthorized)
    in Failure(:user_not_found)
      render(json: result.failure, status: :not_found)
    end
  end

end
