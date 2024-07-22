# frozen_string_literal: true

module Api
  module V1
    class CommentsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_commentable!, only: %i[index create]

      # GET /api/v1/comments
      def index
        response_data = @commentable.comments.each_with_object([]) do |root_comment, result|
          result << CommentSerializer.call(root_comment, current_user)
        end.flatten

        render json: response_data.to_json, status: :ok
      end

      # POST /api/v1/comments
      def create
        comment = build_comment

        if comment.save
          render json: CommentSerializer.call(comment, current_user), status: :created
        else
          render json: { errors: comment.errors }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/comments/:id
      def destroy
        comment = current_user.likes.find(params[:id])
        comment.destroy

        head :no_content
      end

      private

      def comment_params
        params.require(:comment).permit(:body).merge(author: current_user)
      end

      def build_comment
        if @commentable.is_a?(Comment)
          @commentable.children.build(comment_params.merge(commentable: @commentable))
        else
          @commentable.comments.build(comment_params)
        end
      end

      def set_commentable!
        commentable_id = params[:commentable_id] || params.dig(:params, :commentable_id)
        commentable_type = params[:commentable_type] || params.dig(:params, :commentable_type)
        @commentable = commentable_type.classify.constantize.find(commentable_id)
      end
    end
  end
end
