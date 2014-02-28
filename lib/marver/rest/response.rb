require 'json'
require './lib/marver.rb'

module Marver
  module REST
    class Response
      attr_reader :code, :status, :data, :results

      def initialize(raw_json)
        json  = JSON.parse(raw_json)
        @code = json['code'].to_i
        @status = json['status']
        @data = json['data']
      end

    end
  end
end
