# frozen_string_literal: true

class CommentSerializer
  include JSONAPI::Serializer

  attributes :id, :body

  belongs_to :author, id_method_name: :user_id, serializer: :user
end
