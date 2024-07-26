# frozen_string_literal: true

module Api
  module V1
    class TagsController < ApplicationController
      # GET /api/v1/tags

      def index
        render json: TagSerializer.new(ActsAsTaggableOn::Tag.all)
      end
    end
  end
end
