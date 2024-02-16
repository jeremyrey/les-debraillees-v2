# frozen_string_literal: true

class SecureController < ApplicationController

  include LesDebrailleesV2::Deps[user_repo: :user_repo]
  include Dry::Monads[:result, :maybe]

  before_action :authenticate_user

  private

  def authenticate_user
    result = Maybe(request)
      .fmap { _1.headers['Authorization'] }
      .fmap(&:split)
      .fmap(&:last)
      .to_result(:user_not_found)
      .bind { User::UseCases::GetCurrentUser.new(user_repo).call(_1) }

    case result
    in Success(value)
      @current_user = value
    in Failure(:user_not_found)
      render(json: result.failure, status: :unauthorized)
    end
  end

end
