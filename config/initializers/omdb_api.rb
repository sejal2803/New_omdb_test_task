# frozen_string_literal: true

unless Rails.application.credentials.omdb[:api_key]
  raise 'Please provide a valid API key for OMDB (https://www.omdbapi.com)'
end
