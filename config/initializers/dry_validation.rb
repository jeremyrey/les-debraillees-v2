# frozen_string_literal: true

require 'dry/monads/do'

require 'dry-validation'
Dry::Validation.load_extensions(:monads)
