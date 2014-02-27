module Marver
  class SerieSummary
    attr_reader :id, :name, :resource_uri, :type

    def initialize(json, credentials)
      @id = json['id'].to_i || nil
      @credentials = credentials
      @name = json['name']
      @resource_uri = "#{json['resourceURI']}?#{@credentials.to_s}"
      @type = json['type'] || nil
    end

  end
end
