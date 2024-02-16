# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'
require 'jwt'

describe Jwt do
  subject(:service) { described_class.new }

  describe '#encode' do
    let(:input) { { user_id: 'someid' } }

    it 'returns a JWT token' do
      result = service.encode(input)
      expect(result).to be_success
    end
  end

  describe '#decode' do
    let(:input) do
      'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoic29tZWlkIiwiZXhwIjoxNzA4MDk4NDc0fQ.XxGaOhIMve3prUMCb0s_MCrqm-_YgTt9Nq1Q25rsV3c'
    end

    it 'returns a JWT token' do
      result = service.decode(input)
      expect(result).to be_success
      expect(result.value!['user_id']).to eq('someid')
    end
  end
end
