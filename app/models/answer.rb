# frozen_string_literal: true

class Answer < ApplicationRecord
  include Commentable

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :question
  has_many :likes, as: :likeable, dependent: :destroy

  validates :body, presence: true, length: { minimum: 5 }
end
