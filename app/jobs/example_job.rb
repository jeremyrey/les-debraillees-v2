# frozen_string_literal: true

class ExampleJob < ApplicationJob

  queue_as :default

  def perform(*_args)
    # Do something later
    Rails.logger.debug('Hello My boy')
  end

end
