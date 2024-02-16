# frozen_string_literal: true

module ROM
  module Rails
    class Railtie < ::Rails::Railtie

      alias create_container! create_container
      def create_container
        create_container!
      rescue StandardError => e
        puts "Container failed to initialize because of #{e.inspect}"
        puts "This message comes from the monkey patch in #{__FILE__}, if you are using rake, then this is fine"
      end

    end
  end
end
