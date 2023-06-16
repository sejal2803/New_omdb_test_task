# The Open Movie Database - OMDB Rails App

## Description

This is a Ruby 3.2.2 project using Rails 7.0.4. The project is designed to allow users to search for movies using the OMDB API (<https://www.omdbapi.com/>) and store reviews for movies. It utilizes PostgreSQL as the database.

## Setup Instructions

### Prerequisites
- Get the API keys from `https://www.omdbapi.com`. For development environment it is already in the Rails Credentials. Run the following command to check `EDITOR='code --wait' rails credentials:edit -e development`
- Make sure you have the following dependencies installed on your machine:
    - Docker
    - Docker Compose

### Installation Steps
1. Clone the repository to your local machine.
2. Navigate to the project directory.

#### Using Docker

1. Build the Docker images and start the containers by running the following command:
    `docker-compose up --build`
2. Once the containers are up and running, you can access the application at `http://localhost:3000`.

#### Manual Setup

1. Install the required Ruby version (3.2.2) using your preferred Ruby version manager.
2. Install the necessary dependencies by running the following command:
    `bundle install`
3. Configure the database connection in the `config/database.yml` file.
4. Create and set up the database by running the following commands:
    `rails db:create`
    `rails db:migrate`
5.  Start the Rails server by running:
    `rails server`
6.  The application will be available at `http://localhost:3000`.

## Models

### Movie
The `Movie` model contains the following field:
- `imdb_id`: The IMDb ID of the movie.

### Review
The `Review` model is used to store reviews for movies. It contains the following fields:
- `title`: The title of the review.
- `content`: The content of the review.
- `rating`: The rating given to the movie in the review.

### External API
The project uses the OMDB API (<https://www.omdbapi.com/>) to search for movies based on title. The IMDb ID is stored in the `imdb_id` field of the `Movie` model. The API key for the OMDB API should be configured in the Rails credentials file (`config/credentials.yml.enc`).

### Things can be improved in the future
1. Avoid memory_store for cache instead use redis.
2. The movie's index page can be modified to use Ajax to get search results.
3. Exisiting models can be extended with more functionality
4. Sidekiq can be used to get latest movies.
5. It might be possible to add more functionality to the search
6. Use scss for Styling & JavaScript can be better used with jQuery plugin
7. Add Test Suite and test coverage for the code base to improve reliability
