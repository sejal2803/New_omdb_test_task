# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :movie

  validates_presence_of :body
end
