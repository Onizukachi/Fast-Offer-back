# frozen_string_literal: true

class QuestionSerializer
  include JSONAPI::Serializer
  include LikedHelper

  attributes :id, :body, :views_count, :likes_count, :answers_count

  belongs_to :author, id_method_name: :user_id, serializer: :user
  has_many :positions
  has_many :tags
  has_many :answers
end
