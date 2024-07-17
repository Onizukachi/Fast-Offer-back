# frozen_string_literal: true

class CommentSerializer
  include JSONAPI::Serializer
  include LikedHelper

  attributes :id, :body, :likes_count

  belongs_to :author, id_method_name: :user_id, serializer: :user
end
