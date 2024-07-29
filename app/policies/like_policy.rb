# frozen_string_literal: true

class LikePolicy < ApplicationPolicy
  def create?
    true
  end

  def unlike?
    user.likes.any? { |like| like.id == record.id }
  end
end
