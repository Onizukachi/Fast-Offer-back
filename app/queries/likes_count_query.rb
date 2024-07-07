# frozen_string_literal: true

class LikesCountQuery
  attr_reader :likeable_relation

  def initialize(likeable_relation)
    @likeable_relation = likeable_relation
  end

  def [](likeable_entity)
    counts[[likeable_entity.class.to_s, likeable_entity.id]] || 0
  end

  def counts
    @counts ||= Like.where(likeable: likeable_relation).group(:likeable_type, :likeable_id).count
  end
end
