# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

describe Delivery::UseCases::FetchDeliveryPlace do
  let(:place) { Delivery::Entities::DeliveryPlace.new({ id: 1, name: 'Test', description: 'Descr' }) }
  let(:repo) { instance_double('DeliveryPlacesRepo', find_by_id!: place) }
  let(:use_case) { described_class.new(repo) }

  describe '#call' do
    context 'when validation is successful' do
      it 'returns the place' do
        result = use_case.call(place.id)
        expect(result).to eq(place)
      end
    end
  end
end
