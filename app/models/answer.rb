# frozen_string_literal: true

class Answer < ApplicationRecord
  include Commentable
  include Authorable
  include Likeable

  default_scope { order(created_at: :desc) }

  belongs_to :question, counter_cache: true

  validates :body, uniqueness: true, presence: true, length: { minimum: 5 }
end
