module Api
  module V1
    class LikesController < ApplicationController
      before_action :authenticate_user!

      # POST /api/v1/likes
      def create
        like = current_user.likes.build(like_params)

        if like.save
          render json: { like: }, status: :ok
        else
          render json: { errors: like.errors }, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/likes/unlike
      def unlike
        current_user.likes.find_by!(likeable_id: params[:likeable_id], likeable_type: params[:likeable_type]).destroy
      end

      private

      def like_params
        params.require(:like).permit(:likeable_id, :likeable_type)
      end
    end
  end
end
