# frozen_string_literal: true

class Comment < ApplicationRecord
  include Authorable

  belongs_to :commentable, polymorphic: true

  validates :body, presence: true, length: { minimum: 4 }
end
