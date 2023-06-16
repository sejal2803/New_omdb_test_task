# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = if params[:search].present?
                OmdbService.search_movies(params[:search])
              else
                []
              end
  end

  def show
    @movie = OmdbService.get_movie(params[:id])
  end
end
