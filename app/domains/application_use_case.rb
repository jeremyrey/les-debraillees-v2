# frozen_string_literal: true

class ApplicationUseCase

  extend Dry::Initializer
  include Dry::Monads[:result, :maybe]
  include Dry::Monads::Do.for(:call)

end
