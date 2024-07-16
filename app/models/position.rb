# frozen_string_literal: true

class Position < ApplicationRecord
  has_many :position_questions, dependent: :destroy
  has_many :questions, through: :position_questions

  validates :title, presence: true, uniqueness: { case_sensitive: false }

  default_scope { order(:title) }

  before_create :generate_image_filename

  private

  def generate_image_filename
    self.image_filename = "#{title.parameterize(separator: '_')}_#{SecureRandom.hex(8)}"
  end
end
