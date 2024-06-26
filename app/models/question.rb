# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :user

  validates :body, presence: true, length: { minimum: 2 }, uniqueness: true
end
