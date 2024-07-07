# frozen_string_literal: true

class Question < ApplicationRecord
  acts_as_taggable_on :tags

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :answers, dependent: :destroy
  has_many :positions, through: :position_questions
  has_many :likes, as: :likeable, dependent: :destroy

  validates :body, presence: true, length: { minimum: 5 }, uniqueness: true
end
