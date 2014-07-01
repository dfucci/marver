require './lib/marver.rb'

module Marver
  class EventFinder
    class << self
      def find(options = {})
        response = Marver::API::Client.new.get(:events, options)
        results = Marver::DataContainer.new(response).results
        Marver::Event.build(results)
      end
    end
  end
end