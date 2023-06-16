# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :find_movie, only: %i[new create]

  def new
    @review = Review.new
  end

  def create
    @review = @movie.reviews.build(review_params)

    if @review.save
      redirect_to movie_path(@movie.imdb_id)
    else
      render :new
    end
  end

  private

  def find_movie
    @movie = Movie.find_or_create_by(imdb_id: params[:movie_id])
  end

  def review_params
    params.require(:review).permit(:body)
  end
end
