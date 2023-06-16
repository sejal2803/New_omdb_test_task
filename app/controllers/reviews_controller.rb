class ReviewsController < ApplicationController
  def new
    @movie = Movie.find_by(imdb_id: params[:movie_id])
    @review = Review.new
  end

  def create
    @movie = Movie.find_by(imdb_id: params[:movie_id])
    @review = @movie.reviews.build(review_params)

    if @review.save
      redirect_to movie_path(params[:movie_id]), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end
