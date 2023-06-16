# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = OmdbService.search_movies(params[:search]) if params[:search].present?
  end

  def show
    @movie = OmdbService.get_movie(params[:id])
  end
end
