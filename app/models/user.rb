# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  enum role: { basic: 0, moderator: 1, admin: 1 }, _suffix: :role

  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :likes, dependent: :destroy

  before_save :set_gravatar_hash, if: :email_changed?

  def name_from_email
    email.split('@').first
  end

  def ban
    update(is_banned: true) if basic_role?
  end

  def unban
    update(is_banned: false) if basic_role?
  end

  private

  def set_gravatar_hash
    return if email.blank?

    hash = Digest::MD5.hexdigest email.strip.downcase
    self.gravatar_hash = hash
  end
end
