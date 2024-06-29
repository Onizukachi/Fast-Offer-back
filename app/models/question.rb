# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_many :positions, through: :position_questions

  validates :body, presence: true, length: { minimum: 5 }, uniqueness: true
end
