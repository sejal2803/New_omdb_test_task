# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :find_movie, only: %i[index new create]

  def index
    @reviews = @movie.reviews
    @review = Review.new
    @movie = OmdbService.get_movie(@movie.imdb_id)
  end

  def new
    @review = Review.new
  end

  def create
    @review = @movie.reviews.build(review_params)
    @movie = OmdbService.get_movie(@movie.imdb_id)
    @review.save

    flash[:error] = @review.errors.full_messages.join(', ') if @review.errors.any?
    redirect_to movie_reviews_path(@movie['imdbID'])
  end

  private

  def find_movie
    @movie = Movie.find_or_create_by(imdb_id: params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:body)
  end
end
