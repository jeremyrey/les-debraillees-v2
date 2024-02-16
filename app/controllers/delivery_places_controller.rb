# frozen_string_literal: true

class DeliveryPlacesController < ApplicationController

  include LesDebrailleesV2::Deps[repo: :delivery_place_repo]

  def index
    # ExampleJob.set(wait_until: Date.tomorrow.noon).perform_later("test")
    render(json: repo.all.map(&:details).to_json)
  end

  def show
    contract = Delivery::Contracts::GetDeliveryPlace.new.call(params.to_enum.to_h)
    if contract.success?
      render(json: Delivery::UseCases::FetchDeliveryPlace.new(repo).call(contract.to_h[:id]).details)
    else
      render(json: contract.errors.to_h)
    end
  end

end
