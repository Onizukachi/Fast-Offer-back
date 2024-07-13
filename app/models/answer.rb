# frozen_string_literal: true

class Answer < ApplicationRecord
  include Commentable
  include Authorable

  default_scope { order(created_at: :desc) }

  belongs_to :question, counter_cache: true
  has_many :likes, as: :likeable, dependent: :destroy

  validates :body, presence: true, length: { minimum: 5 }
end
