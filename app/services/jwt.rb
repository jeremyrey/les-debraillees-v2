# frozen_string_literal: true

require 'jwt'

class Jwt

  include Dry::Monads[:try]

  SECRET_KEY = ENV.fetch('JWT_SECRET_KEY')

  def encode(payload, exp: 7.days.from_now)
    Try[JWT::EncodeError] do
      payload[:exp] = exp.to_i
      JWT.encode(payload, SECRET_KEY)
    end.to_result
  end

  def decode(token)
    Try[JWT::DecodeError] { JWT.decode(token, SECRET_KEY)[0] }.to_result
  end

end
