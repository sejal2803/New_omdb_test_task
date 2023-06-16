# frozen_string_literal: true

class OmdbService
  BASE_URI = 'http://www.omdbapi.com'

  class << self
    def search_movies(search_param)
      return [] unless search_param

      perform_request("/?s=#{encode_param(search_param)}")['Search']
    end

    def get_movie(imdb_id)
      Rails.cache.fetch("omdb_movie_#{imdb_id}", expires_in: 1.day) do
        perform_request("/?i=#{imdb_id}")
      end
    end

    private

    def perform_request(endpoint)
      response = HTTParty.get("#{BASE_URI}#{endpoint}&apikey=#{api_key}")
      raise 'Please check the API key for OMDB or the query is invalid' unless response.ok?

      response
    end

    def encode_param(param)
      URI.encode_www_form_component(param)
    end

    def api_key
      Rails.application.credentials.omdb[:api_key]
    end
  end
end
