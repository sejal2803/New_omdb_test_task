# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
