# frozen_string_literal: true

ROM::Rails::Railtie.configure do |config|
  config.gateways[:default] = [:sql, ENV.fetch('DATABASE_URL')]
  # config.auto_registration_paths << 'src/infra/persistence'
  config.auto_registration_paths = [{ path: 'app/infrastructure/persistence', namespace: 'Persistence' }]
end
