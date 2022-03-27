# frozen_string_literal: true

module Tools
  class GithubApiTool
    BASE_URL = 'api.github.com'
    private_class_method :new

    def initialize(path, params)
      @path = path
      @params = params
    end

    def self.search(params)
      new('search/repositories', params).perform
    end

    def perform
      RestClient.get("#{BASE_URL}/#{@path}",
                     { params: @params })
    end
  end
end
