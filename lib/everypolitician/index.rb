# frozen_string_literal: true

require 'json'
require 'open-uri'

module Everypolitician
  class Index
    DEFAULT_INDEX_URL = 'https://raw.githubusercontent.com/' \
      'everypolitician/everypolitician-data/master/countries.json'

    attr_reader :index_url

    def initialize(index_url: DEFAULT_INDEX_URL)
      @index_url = index_url
    end

    def country(slug)
      country_index[slug.to_s.downcase]
    end

    def countries
      @countries ||= begin
        JSON.parse(URI.open(index_url, &:read), symbolize_names: true).map do |c|
          Country.new(c)
        end
      end
    end

    def all_legislatures
      @all_legislatures ||= countries.flat_map(&:legislatures)
    end

    private

    def country_index
      @country_index ||= Hash[countries.map { |c| [c.slug.downcase, c] }]
    end
  end
end
