# frozen_string_literal: true

class Question < ApplicationRecord
  validates :body, presence: true, length: { minimum: 2 }, uniqueness: true
end
