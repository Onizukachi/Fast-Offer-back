# frozen_string_literal: true

class Question < ApplicationRecord
  include Authorable
  include Likeable

  acts_as_taggable_on :tags

  belongs_to :grade, class_name: 'ItGrade', foreign_key: 'it_grades_id'
  has_many :answers, dependent: :destroy
  has_many :position_questions, dependent: :destroy
  has_many :positions, through: :position_questions

  validates :body, presence: true, length: { minimum: 5 }, uniqueness: true
end
