# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      render json: {
        status: { message: 'Logged in sucessfully.' },
        data: resource
      }, status: :ok
    end

    def respond_to_on_destroy
      if current_user
        render json: {
          message: 'logged out successfully'
        }, status: :ok
      else
        render json: {
          message: "Couldn't find an active session."
        }, status: :unauthorized
      end
    end
  end
end
